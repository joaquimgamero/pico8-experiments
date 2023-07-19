pico-8 cartridge // http://www.pico-8.com
version 41
__lua__
function _init()
 r=10
 clr=12
 life=10
 
 -- number of circles per row
 n_circs=flr(128/(r*2))^2
 shrink_amount=r/life
 
 circles={}
end



function _draw()
 cls(1)
 
 if #circles > 0 then
  for i=1,#circles do
   local circle=circles[i]
   circfill(i*r,i*r,circle.r,circle.clr)
  end
 end
end



function _update()
 if btnp(❎) and #circles==0 then
  for i=1,n_circs do
   add(circles,{
    r=r,
    clr=clr,
    life=life
   })
  end
 end
 
 for circle in all(circles) do
  if circle.life>0 then
   circle.r-=shrink_amount
   circle.life-=1
  else
   del(circles,circle)
  end
 end
end

__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
