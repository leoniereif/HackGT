scriptId = 'com.gthack.fittrack'
scriptTitle = "Location Tracker"
scriptDetailsUrl = "" -- We don't have this until it's submitted to the Myo Market

workingOut = false

myo.setLockingPolicy("none")

function onPoseEdge(pose, edge)
	if(edge == "on") then
	    if pose == "doubleTap" then
	    	myo.debug("NEXT EXORCISE")
	    end
	    if pose == "fingersSpread" then
	    	if workingOut == false then
	    		workingOut = true
				myo.debug("STARTING EXORCISE")
				coroutine.resume(co)
	    	else
	    		workingOut = false
				myo.debug("STOPPING EXORCISE")
	    	end
	    end
	end
end

co = coroutine.create(function ()
		local i = 0
		myo.debug("IN THE COROUTINE")
	end)

function onPeriodic()
end

function onForegroundWindowChange(app, title)
    myo.debug("onForegroundWindowChange: " .. app .. ", " .. title)
    return true
end

function activeAppName()
    return "Location Tracker"
end

function onActiveChange(isActive)
    myo.debug("onActiveChange")
end