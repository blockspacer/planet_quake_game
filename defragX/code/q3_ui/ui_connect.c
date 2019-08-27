// Copyright (C) 1999-2000 Id Software, Inc.
//
#include "ui_local.h"

/*
===============================================================================
CONNECTION SCREEN
===============================================================================
*/

static connstate_t	lastConnState;
static char			lastLoadingText[MAX_INFO_VALUE];

static void UI_ReadableSize ( char *buf, int bufsize, int value )
{
	if (value > 1024*1024*1024 ) { // gigs
		Com_sprintf( buf, bufsize, "%d", value / (1024*1024*1024) );
		Com_sprintf( buf+strlen(buf), bufsize-strlen(buf), ".%02d GB",
			(value % (1024*1024*1024))*100 / (1024*1024*1024) );
	} else if (value > 1024*1024 ) { // megs
		Com_sprintf( buf, bufsize, "%d", value / (1024*1024) );
		Com_sprintf( buf+strlen(buf), bufsize-strlen(buf), ".%02d MB",
			(value % (1024*1024))*100 / (1024*1024) );
	} else if (value > 1024 ) { // kilos
		Com_sprintf( buf, bufsize, "%d KB", value / 1024 );
	} else { // bytes
		Com_sprintf( buf, bufsize, "%d bytes", value );
	}
}

// Assumes time is in msec
static void UI_PrintTime ( char *buf, int bufsize, int time ) {
	time /= 1000;  // change to seconds

	if (time > 3600) { // in the hours range
		Com_sprintf( buf, bufsize, "%d hr %d min", time / 3600, (time % 3600) / 60 );
	} else if (time > 60) { // mins
		Com_sprintf( buf, bufsize, "%d min %d sec", time / 60, time % 60 );
	} else  { // secs
		Com_sprintf( buf, bufsize, "%d sec", time );
	}
}

static void UI_DisplayDownloadInfo( const char *downloadName ) {
	static char dlText[]	= "Downloading:";
	static char etaText[]	= "Estimated time left:";
	static char xferText[]	= "Transfer rate:";

	int downloadSize, downloadCount, downloadTime, percentage;
	char dlSizeBuf[64], totalSizeBuf[64], xferRateBuf[64], dlTimeBuf[64], buf[64];
	int xferRate;
	int width, leftWidth, div;
	int style = UI_LEFT|UI_SMALLFONT|UI_DROPSHADOW;
	const char *s;

	trap_Cvar_VariableStringBuffer( "cl_downloadSize", buf, sizeof( buf ) );
	downloadSize = atoi( buf );
	trap_Cvar_VariableStringBuffer( "cl_downloadCount", buf, sizeof( buf ) );
	downloadCount = atoi( buf );
	trap_Cvar_VariableStringBuffer( "cl_downloadTime", buf, sizeof( buf ) );
	downloadTime = atoi( buf );

	leftWidth = width = UI_ProportionalStringWidth( dlText ) * UI_ProportionalSizeScale( style );
	width = UI_ProportionalStringWidth( etaText ) * UI_ProportionalSizeScale( style );
	if (width > leftWidth) leftWidth = width;
	width = UI_ProportionalStringWidth( xferText ) * UI_ProportionalSizeScale( style );
	if (width > leftWidth) leftWidth = width;
	leftWidth += 16;

	UI_DrawProportionalString( 8, 128, dlText, style, color_white );
	UI_DrawProportionalString( 8, 160, etaText, style, color_white );
	UI_DrawProportionalString( 8, 224, xferText, style, color_white );

	if (downloadSize > 0) {
		if ( downloadCount > 21474836 ) {// x100 could cause overflow!
			div = downloadSize >> 8;
			if ( div )
				percentage = (downloadCount >> 8) * 100 / div;
			else
				percentage = 0;
		} else
			percentage = downloadCount * 100 / downloadSize;
		if ( percentage > 100 )
			percentage = 100;
		s = va( "%s (%d%%)", downloadName, percentage );
	} else {
		s = downloadName;
	}

	UI_DrawProportionalString( leftWidth, 128, s, style, color_white );

	UI_ReadableSize( dlSizeBuf,		sizeof dlSizeBuf,		downloadCount );
	UI_ReadableSize( totalSizeBuf,	sizeof totalSizeBuf,	downloadSize );

	if (downloadCount < 4096 || !downloadTime) {
		UI_DrawProportionalString( leftWidth, 160, "estimating", style, color_white );
		UI_DrawProportionalString( leftWidth, 192,
			va("(%s of %s copied)", dlSizeBuf, totalSizeBuf), style, color_white );
	} else {

	  if ( (uis.realtime - downloadTime) / 1000) {
			xferRate = downloadCount / ((uis.realtime - downloadTime) / 1000);
		} else {
			xferRate = 0;
		}

		UI_ReadableSize( xferRateBuf, sizeof xferRateBuf, xferRate );

		// Extrapolate estimated completion time
		if (downloadSize && xferRate) {
			int n = downloadSize / xferRate; // estimated time for entire d/l in secs

			// We do it in K (/1024) because we'd overflow around 4MB
			n = (n - (((downloadCount/1024) * n) / (downloadSize/1024))) * 1000;

			UI_PrintTime ( dlTimeBuf, sizeof dlTimeBuf, n );
			UI_DrawProportionalString( leftWidth, 160, dlTimeBuf, style, color_white );
			UI_DrawProportionalString( leftWidth, 192, va("(%s of %s copied)", dlSizeBuf, totalSizeBuf), style, color_white );
		} else {
			UI_DrawProportionalString( leftWidth, 160, "estimating", style, color_white );
			if (downloadSize) {
				UI_DrawProportionalString( leftWidth, 192, va("(%s of %s copied)", dlSizeBuf, totalSizeBuf), style, color_white );
			} else {
				UI_DrawProportionalString( leftWidth, 192, va("(%s copied)", dlSizeBuf), style, color_white );
			}
		}

		if (xferRate) {
			UI_DrawProportionalString( leftWidth, 224, va("%s/Sec", xferRateBuf), style, color_white );
		}
	}
}

/*
========================
UI_DrawConnectScreen

This will also be overlaid on the cgame info screen during loading
to prevent it from blinking away too rapidly on local or lan games.
========================
*/
void UI_DrawConnectScreen( qbool overlay ) {
	char			*s;
	uiClientState_t	cstate;
	char			info[MAX_INFO_VALUE];

	UI_VideoCheck( trap_Milliseconds() );

	Menu_Cache();

    // draw the dialog background
    UI_SetColor( color_white );
    // fill whole screen, not just 640x480 virtual rectangle
    //trap_R_DrawStretchPic( 0, 0, uis.glconfig.vidWidth, uis.glconfig.vidHeight, 0, 0, 1, 1, uis.menuBackNoLogoShader );

	// see what information we should display
	trap_GetClientState( &cstate );

	info[0] = '\0';
	if( trap_GetConfigString( CS_SERVERINFO, info, sizeof(info) ) ) {
		UI_DrawProportionalString( 320, 16, va( "Loading %s", Info_ValueForKey( info, "mapname" ) ), UI_BIGFONT|UI_CENTER|UI_DROPSHADOW, color_white );
	}

	UI_DrawProportionalString( 320, 64, va("Connecting to %s", cstate.servername), UI_CENTER|UI_SMALLFONT|UI_DROPSHADOW, menu_text_color );

	// print any server info (server full, bad version, etc)
	if ( cstate.connState < CA_CONNECTED ) {
		UI_DrawProportionalString_AutoWrapped( 320, 192, 630, 20, cstate.messageString, UI_CENTER|UI_SMALLFONT|UI_DROPSHADOW, menu_text_color );
	}

	if ( lastConnState > cstate.connState ) {
		lastLoadingText[0] = '\0';
	}
	lastConnState = cstate.connState;

	switch ( cstate.connState ) {
	case CA_CONNECTING:
		s = va("Awaiting challenge...%i", cstate.connectPacketCount);
		break;
	case CA_CHALLENGING:
		s = va("Awaiting connection...%i", cstate.connectPacketCount);
		break;
	case CA_CONNECTED: {
		char downloadName[MAX_INFO_VALUE];

			trap_Cvar_VariableStringBuffer( "cl_downloadName", downloadName, sizeof(downloadName) );
			if (*downloadName) {
				UI_DisplayDownloadInfo( downloadName );
				return;
			}
		}
		s = "Awaiting gamestate...";
		break;
	case CA_LOADING:
		return;
	case CA_PRIMED:
		return;
	default:
		return;
	}

	UI_DrawProportionalString( 320, 128, s, UI_CENTER|UI_SMALLFONT|UI_DROPSHADOW, color_white );

}


/*
===================
UI_KeyConnect
===================
*/
void UI_KeyConnect( int key ) {
	if ( key == K_ESCAPE ) {
		trap_Cmd_ExecuteText( EXEC_APPEND, "disconnect\n" );
		return;
	}
}
