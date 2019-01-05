var l = argument1   //line
var v = argument2   //add to value
with argument0 {    //arg0: Abil object ptr
  Value[l]+= v
  Anim = true
  AnimLine = l
  if AnimCl == 0
    if v > 0
      AnimCl = c_green
    else if v < 0
      AnimCl = c_red
  else
    if v > 0
      AnimCl = merge_color(c_green, AnimCl, 0.5)
    else if v < 0
      AnimCl = merge_color(c_red, AnimCl, 0.5)
  }
