//arg0 - tick curr
//arg1 - tick max
var a = (argument0 / argument1) *10;
var b = floor(a);
var c = ceil(a);
if b==c
  return funcTickPercent(b)
a-= b                         //оставить только дробь
b = funcTickPercent(b)
c = funcTickPercent(c)
return (c-b)*a +b
