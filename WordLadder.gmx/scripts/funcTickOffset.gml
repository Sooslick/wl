//arg0 - tickno
//arg1 - min pos
//arg2 - max pos
//arg3 - false in  true out
//return final offset
switch (argument0)
  {
  case 1: p = 0.03; break;
  case 2: p = 0.1; break;
  case 3: p = 0.21; break;
  case 4: p = 0.34; break;
  case 5: p = 0.5; break;
  case 6: p = 0.66; break;
  case 7: p = 0.79; break;
  case 8: p = 0.9; break;
  case 9: p = 0.97; break;
  case 10: p = 1; break;
  default: p = 0; break;
  }
if argument3
  return argument1 + (argument2-argument1) * p
else
  return argument2 - (argument2-argument1) * p
