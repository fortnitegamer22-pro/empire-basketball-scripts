-- decompiled by Sentinel (took 1.235544ms)
local v_u_33 = {
	["Expt"] = function(_, p1, p2, p3, p4)
		-- upvalues: (copy) v_u_33
		if math.abs(p2 - p1) < 0.01 then
			return p2
		else
			return p1 + (p2 - p1) * v_u_33:Expty(p1, p2, p3, p4)
		end
	end, 
	["Expty"] = function(_, _, _, p5, p6)
		return 1 - math.exp(--math.log(1 - p5) * p6)
	end, 
	["Sign"] = function(_, p7)
		return 0 < p7 and 1 or p7 < 0 and -1 or 0
	end, 
	["BezierValForT"] = function(_, p8, p9, p10, p11, p12)
		return (1 - p12) * (1 - p12) * (1 - p12) * p8 + 3 * p12 * (1 - p12) * (1 - p12) * p9 + 3 * p12 * p12 * (1 - p12) * p10 + p12 * p12 * p12 * p11
	end, 
	["_BezierPt2ForT"] = {
		["x"] = 0, 
		["y"] = 0
	}, 
	["BezierPt2ForT"] = function(_, p13, p14, p15, p16, p17, p18, p19, p20, p21)
		-- upvalues: (copy) v_u_33
		v_u_33._BezierPt2ForT.x = v_u_33:BezierValForT(p13, p15, p17, p19, p21)
		v_u_33._BezierPt2ForT.y = v_u_33:BezierValForT(p14, p16, p18, p20, p21)
		return v_u_33._BezierPt2ForT
	end, 
	["YForPointOf2PtLine"] = function(_, p22, p23, p24)
		local v25 = (p22.y - p23.y) / (p22.x - p23.x)
		return v25 * p24 + p22.y - v25 * p22.x
	end, 
	["DeltaTimeToTimescale"] = function(_, p26)
		return p26 / 0.016666666666666666
	end, 
	["SecondsToTick"] = function(_, p27)
		return 0.016666666666666666 / p27
	end, 
	["ExptValueInSeconds"] = function(_, p28, p29, p30)
		return 1 - math.pow(p28 / p29, 1 / 60 * p30)
	end, 
	["NormalizedDefaultExptValueInSeconds"] = function(p31, p32)
		return p31:ExptValueInSeconds(0.01, 1, p32)
	end
}
return v_u_33
