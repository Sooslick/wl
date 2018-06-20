tick = argument0
//count basics
ms = tick mod 30
tick = tick div 30
s = tick mod 60
tick = tick div 60
m = tick mod 60
tick = tick div 60
h = tick mod 24
d = tick div 24
//cotcat final cstring
str = ''
if d<>0
    str+= string(d) + 'd, '
    
str+= string(h) + ':'
if m<10 str+= '0'
str+= string(m) + ':'
if s<10 str+= '0'
str+= string(s) + ':'
if ms<10 str+= '0'
str+= string(ms)

return str
