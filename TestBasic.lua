scriptId = 'com.gthack.fittrack'
scriptTitle = "Location Tracker"
scriptDetailsUrl = "" -- We don't have this until it's submitted to the Myo Market

workingOut = false
reps = 0

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
				reps = 10
				coroutine.resume(co)
	    	else
	    		workingOut = false
				myo.debug("STOPPING EXORCISE")
				reps = 0
	    	end
	    end
	end
end
-- co = coroutine.create(function ()
--            for i=1,10 do
--              myo.debug("co" .. i)
--              coroutine.yield()
--            end
--          end)

co = coroutine.create(function ()
		myo.debug("IN THE COROUTINE")
		while true do
			counter = 0
			myo.debug("counter: " .. counter .. "reps: " .. reps)
			while counter < reps do
				myo.debug(math.deg(myo.getPitch()))
				counter = counter + 1
			end
			coroutine.yield()
		end
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