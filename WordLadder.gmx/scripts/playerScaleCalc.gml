var p = argument0    //player ptr
//argument1 - column name: 0 = score; 1 = name; 2 = word
var w = argument2    //width
var s = argument3    //string

draw_set_font(fImpact64)
switch argument1 {
  case 0:           //score
    var tsc = w / string_width(s)
    if tsc > 1
      tsc = 1
    p.ScScore = tsc
    break;
  case 1:           //name
    var tsc = w / string_width(s)
    if tsc > 1
      tsc = 1
    p.ScName = tsc
    break;
  case 2:           //word
    if string_length(w) > 3
      p.ScWord = 1 - string_length(w)/50
    break;
  }
