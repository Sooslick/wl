var w; var h;
if window_get_fullscreen() {
  w = display_get_width()
  h = display_get_height()
  }
else {
  w = global.WIN_WIDTH
  h = global.WIN_HEIGHT
  }
surface_resize(application_surface, w, h)
