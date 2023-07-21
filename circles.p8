pico-8 cartridge // http://www.pico-8.com
version 41
__lua__
function _init()
 r=9
 offset=3
 clr=12
 life=15
 
 -- number of circles per row
 n_circs_row=flr(128/(r*2))
 -- how much shrink per frame
 shrink_amount=(r+offset)/life
 
 circles={}
end

function _draw()
 cls(1)
 
 foreach(circles, function(c)
   circfill(c.x, c.y, c.r, c.clr)
 end)
end

function _update()
 -- press x
 if btn(5) then
  generate_circles()
 end
 
 -- update circles
 for circle in all(circles) do
  if circle.life>0 then
   circle.r-=shrink_amount
   circle.life-=1
  else
   del(circles,circle)
  end
 end
end

function generate_circles()
 local row=1
 local col=1
  
 for i=1,n_circs_row^2 do
  add(circles,{
   r=r+offset,
   clr=clr,
   life=life,
   x=col+r,
   y=row+r,
  })
  
  col+=r*2
   
  -- change to next row
  if col+r*2 >= 128 then
  	col=1
  	row+=r*2
  end
 end
end

