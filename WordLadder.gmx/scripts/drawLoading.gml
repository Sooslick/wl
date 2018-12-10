//argument0: rotation

//argument1: drawx
//argument2: drawy

var dx, dy;
if argument_count > 1 {
  dx = argument[1]
  dy = argument[2]
  }
else {
  dx = 1500
  dy = 80
  }

draw_sprite_ext(sLoading,0,dx,dy,2,2,argument[0],c_white,1)
draw_sprite_ext(sLoading,0,dx,dy,1,1,-argument[0]*2,c_white,1)
