pico-8 cartridge // http://www.pico-8.com
version 41
__lua__
-- snake game

function _init()
 friction=.7
 
	snk={
	 x=64,
	 y=64,
	 dx=0,
	 dy=0,
	 acc=0.4,
	}
end

function _update()

 -- move snake
 
 if (btn(⬅️)) snk.dx-=snk.acc
 if (btn(➡️)) snk.dx+=snk.acc
 if (btn(⬆️)) snk.dy-=snk.acc
 if (btn(⬇️)) snk.dy+=snk.acc
	
	snk.x+=snk.dx
	snk.y+=snk.dy
	
	snk.dx*=friction
	snk.dy*=friction
end

function _draw()
	cls()
	
	circfill(snk.x,snk.y,3,8)
end
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
