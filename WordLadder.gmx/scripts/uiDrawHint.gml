//hint drawing
if hint && (hintMsg!='') && clickable
  {
  var my;
  var dy = (sy-y)
  if window_get_fullscreen()
    my = (display_mouse_get_y()-global.DRAW_VOFF) / global.DRAW_SCALE - dy
  else
    my = (window_mouse_get_y()-global.DRAW_VOFF) / global.DRAW_SCALE - dy
  draw_set_font(fHint)
  draw_set_halign(fa_left)
  draw_set_valign(fa_top)
  var h = string_height_ext(hintMsg, 50, 500) + 12;
  draw_set_alpha(0.75)
  draw_set_color(0)
  draw_rectangle(x - 256*dsc, my - h*dsc, x + 256*dsc, my, false)
  draw_set_alpha(1)
  draw_set_color(c_white)
  h-= 6
  draw_text_ext_transformed(x - 250*dsc, my - h*dsc, hintMsg, 50,500, dsc, dsc, 0)
  }
