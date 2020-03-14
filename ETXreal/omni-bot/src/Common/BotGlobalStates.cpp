////////////////////////////////////////////////////////////////////////////////
// 
// $LastChangedBy: jswigart $
// $LastChangedDate: 2010-08-28 07:12:05 +0200 (Sa, 28 Aug 2010) $
// $LastChangedRevision: 32 $
//
////////////////////////////////////////////////////////////////////////////////

#include "PrecompCommon.h"
#include "BotGlobalStates.h"

namespace AiState
{
	RegionTriggers::RegionTriggers() 
		: StateChild("RegionTriggers")
	{
	}

	//////////////////////////////////////////////////////////////////////////

	GlobalRoot::GlobalRoot() : StateFirstAvailable("GlobalRoot") 
	{
		AppendState(new RegionTriggers);
	}

};