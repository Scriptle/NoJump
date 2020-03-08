-- Tracks places that use NoJump for analytical purposes. Please do not edit or remove.

local config = {
	DoNotReportScriptErrors = true,
	DoNotTrackServerStart = false,
	DoNotTrackVisits = true
}
 
local GA = require(153590792)
GA.Init("UA-160020179-1", config)