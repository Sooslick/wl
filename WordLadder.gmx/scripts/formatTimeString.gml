var tick = argument0;
if tick < 0
  tick = 0
//count basics
var ms = tick mod 1000;
tick = tick div 1000
var s = tick mod 60;
tick = tick div 60
var m = tick mod 60;
tick = tick div 60
var h = tick mod 24;
var d = tick div 24;
//cotcat final cstring
var str = '';
if d<>0
    str+= string(d) + 'd, '
    
str+= string(h) + ':'
if m<10 str+= '0'
str+= string(m) + ':'
if s<10 str+= '0'
str+= string(s) + '.'
if ms<100 str+= '0'
if ms<10 str+= '0'
str+= string(ms)

return str
