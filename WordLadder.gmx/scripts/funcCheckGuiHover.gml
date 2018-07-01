x1 = argument0
y1 = argument1
x2 = argument2
y2 = argument3

if global.config[?'Fullscreen']
  {
  if ((display_mouse_get_x()-global.DRAW_HOFF) / global.DRAW_SCALE < x2) &&    
     ((display_mouse_get_x()-global.DRAW_HOFF) / global.DRAW_SCALE > x1) &&   
     ((display_mouse_get_y()-global.DRAW_VOFF) / global.DRAW_SCALE < y2) &&     
     ((display_mouse_get_y()-global.DRAW_VOFF) / global.DRAW_SCALE > y1)  
        return true
  else
        return false
  }
else
  {
  if ((window_mouse_get_x()-global.DRAW_HOFF) / global.DRAW_SCALE < x2) &&    
     ((window_mouse_get_x()-global.DRAW_HOFF) / global.DRAW_SCALE > x1) &&   
     ((window_mouse_get_y()-global.DRAW_VOFF) / global.DRAW_SCALE < y2) &&     
     ((window_mouse_get_y()-global.DRAW_VOFF) / global.DRAW_SCALE > y1)  
        return true
  else
        return false
  }
