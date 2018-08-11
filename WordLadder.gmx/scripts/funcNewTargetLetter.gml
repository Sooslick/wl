var chance = argument0;         //array[4]
var total = chance[0] + chance[1] + chance[2] + chance[3];
//TODO locale!
var a;
a[0] = 'AEIOUY';
a[1] = 'RTPSDGNL'
a[2] = 'FHKMJC';
a[3] = 'QZWXVB'
var curr = random(total);
if curr < chance[0]
  return string_char_at(a[0],irandom_range(1,string_length(a[0])))
curr-= chance[0]
if curr < chance[1]
  return string_char_at(a[1],irandom_range(1,string_length(a[1])))
curr-= chance[1]
if curr < chance[2]
  return string_char_at(a[2],irandom_range(1,string_length(a[2])))
curr-= chance[2]
return string_char_at(a[3],irandom_range(1,string_length(a[3])))
