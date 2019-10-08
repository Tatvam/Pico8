pico-8 cartridge // http://www.pico-8.com
version 18
__lua__
-- global variables
score = 0
list = {}


-- init
function _init()
	cls()
	for i=1,10 do
		local x = rnd(100)
		--print(x)
		local y = rnd(100)
		local rad = 4
		local col = flr(rnd(15))
		local dx = rnd(0.5)
		local dy = rnd(0.5)			
		local circle = {x,y,rad,col,dx,dy}
		add(list,circle)
	end
end

function _update()
	for i=1,10 do 
	 for j=i+1,10 do
				local x = (list[i][1] - list[j][1])^2
				local y = (list[i][2] - list[j][2])^2
				local dis = sqrt(x+y)
				local cx = list[i][1]
				local cy = list[i][2]
				local c1x = list[j][1]
				local c1y = list[j][2]
				local radd = list[i][3] + list[j][3]
				if dis < radd then
					local midx = (cx + c1x)/2
					local midy = (cy + c1y)/2
					list[i][1] = midx + list[i][3]*(cx - c1x)/dis
					list[i][2] = midy + list[i][3]*(cy - c1y)/dis
					list[j][1] = midx + list[j][3]*(c1x - cx)/dis
					list[j][2] = midy + list[j][3]*(c1y - cy)/dis
				end
			end
			if list[i][1] + list[i][3] >= 127 then
				list[i][1] = 127 - list[i][3]
				list[i][5]=-list[i][5]
		 elseif list[i][1] - list[i][3] <= 0 then
		 	list[i][1] = list[i][3]
	 		list[i][5]=-list[i][5]
		 end
	 
		 if list[i][2] - list[i][3] <= 0 then
		 	list[i][2] = list[i][3]
				list[i][6]=-list[i][6]
			elseif list[i][2] + list[i][3] >= 127 then
				list[i][2] = 127 - list[i][3]
	 		list[i][6]=-list[i][6]
		 end
	 	list[i][1]+=list[i][5]
			list[i][2]+=list[i][6]
		end
end


function _draw()
	cls()
	for i=1,10 do
		circfill(list[i][1],list[i][2],list[i][3],list[i][4])
	end
end
	

__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
