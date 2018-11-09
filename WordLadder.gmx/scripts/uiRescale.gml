//argument 0: max content w
//set font to calc string w
draw_set_font(font)

//must be called after set ui contents
tsc = argument0 / string_width(content)
if tsc > 1
  tsc = 1       //reset scale if it not necessary
tsc*= dsc   //draw scalability

//apply depth
StartDepth = depth
