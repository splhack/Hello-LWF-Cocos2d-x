if not LWF then LWF={} end
if not LWF.Script then LWF.Script={} end
if not LWF.Script.cat then LWF.Script.cat={} end
local _root

LWF.Script.cat.Init = function(self)
	local movie = self
	while movie.parent ~= nil do
		movie = movie.parent.lwf.rootMovie
	end
	_root = movie
end

LWF.Script.cat.Destroy = function(self)
	_root = nil
end

LWF.Script.cat.chara_0_buttonSymbol_button_press = function(self)
		self:gotoAndPlay("jump")
end

LWF.Script.cat.chara_enterFrame = function(self)
	self.x = self.x + 1
end
