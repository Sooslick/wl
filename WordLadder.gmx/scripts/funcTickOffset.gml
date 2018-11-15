//arg0 - tickno
//arg1 - min pos
//arg2 - max pos
//arg3 - false in  true out
//return final offset
var p = funcTickPercent(argument0);
if argument3
  return argument1 + (argument2-argument1) * p
else
  return argument2 - (argument2-argument1) * p
