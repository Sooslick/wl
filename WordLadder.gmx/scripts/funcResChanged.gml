//WINDOW SIZE: W, H, H:W
if global.config[?'Fullscreen'] {
  global.WIN_HEIGHT = display_get_height()
  global.WIN_WIDTH = display_get_width()
  window_set_fullscreen(true)
  } 
else {
  global.WIN_HEIGHT = global.config[?'ScreenH']
  global.WIN_WIDTH = global.config[?'ScreenW']
  window_set_fullscreen(false)
  window_set_size(global.WIN_WIDTH,global.WIN_HEIGHT)
  }
global.WIN_RATIO = global.WIN_HEIGHT / global.WIN_WIDTH

//WINDOW OFFSETS & SCALES
if global.WIN_RATIO  >=0.75          //4:3
  {
  global.DRAW_SCALE = global.WIN_WIDTH / 1600           //black lines on top & bottom
  global.DRAW_VOFF = (global.WIN_HEIGHT - 1200*global.DRAW_SCALE) / 2
  global.DRAW_HOFF = 0
  global.G_VOFF = ((global.WIN_HEIGHT*1600 / global.WIN_WIDTH) -1200) /2
  global.G_HOFF = 0                                     //gui offsets
  }
else 
  {
  global.DRAW_SCALE = global.WIN_HEIGHT / 1200          //black on left & right
  global.DRAW_VOFF = 0
  global.DRAW_HOFF = (global.WIN_WIDTH - 1600*global.DRAW_SCALE) / 2 
  global.G_VOFF = 0
  global.G_HOFF = ((global.WIN_WIDTH*1200 / global.WIN_HEIGHT) -1600) /2
  }
  
//ROOM VIEW SCALES
global.UPORTW = 1200 / global.WIN_RATIO   //width upscale
global.UPORTH = global.UPORTW * global.WIN_RATIO
global.DPORTH = 1600 * global.WIN_RATIO  //height downscale
global.DPORTW = global.DPORTH / global.WIN_RATIO

//GUI SIZING
global.G_LEFT = -global.G_HOFF
global.G_RIGHT = 1600+global.G_HOFF
global.G_UP = -global.G_VOFF
global.G_DOWN = 1200+global.G_VOFF
display_set_gui_size(1600,1200)
display_set_gui_maximise(global.DRAW_SCALE, global.DRAW_SCALE, global.DRAW_HOFF, global.DRAW_VOFF)
