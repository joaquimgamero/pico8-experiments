-- snake game

function _init()
 friction=.7
 
	snk={
		{
			 x=64,
		  y=64,
		  dx=0,
		  dy=0,
		  acc=0.5,
		},
	}
end

function _update()

 -- move snake
 local snk_head=snk[1]
 
 if (btn(⬅️)) snk_head.dx-=snk_head.acc
 if (btn(➡️)) snk_head.dx+=snk_head.acc
 if (btn(⬆️)) snk_head.dy-=snk_head.acc
 if (btn(⬇️)) snk_head.dy+=snk_head.acc
	
	-- add speed
	snk_head.x+=snk_head.dx
	snk_head.y+=snk_head.dy
	
	-- relax using friction
	snk_head.dx*=friction
	snk_head.dy*=friction
end

function _draw()
	cls(8)
	
	for c in all(snk) do
			circfill(c.x,c.y,3,10)
	end
end
