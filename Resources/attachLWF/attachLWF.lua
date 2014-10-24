if not LWF then LWF={} end
if not LWF.Script then LWF.Script={} end
if not LWF.Script.attachLWF then LWF.Script.attachLWF={} end
local _root

LWF.Script.attachLWF.Init = function(self)
	local movie = self
	while movie.parent ~= nil do
		movie = movie.parent.lwf.rootMovie
	end
	_root = movie
end

LWF.Script.attachLWF.Destroy = function(self)
	_root = nil
end

LWF.Script.attachLWF._root_postLoad = function(self)
	log("attachLWF.lwf postLoad")
	
	function newListener()
	    local n = 0
	    return function(button)
	        log("press! " .. n .. " (" .. self.lwf.pointX .. ", " .. self.lwf.pointY .. ")")
	        local p = LWF.Point:new(self.lwf.pointX, self.lwf.pointY)
			p = button.parent:globalToLocal(p)
			log(" -> (" .. p.x .. ", " .. p.y .. ")")
	
	        local child = self:attachLWF("cat/cat.lwf", "cat" .. n)
			child.rootMovie:move(p.x, p.y)
	        n = n + 1
			log(n)
	    end
	end
	
	self.button:addEventListener("press", newListener())
end
