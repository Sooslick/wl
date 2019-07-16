var tick = argument[0];   //total ms
var format = 'H:m:s.3';
if argument_count > 1
  format = argument[1]
  
//ticker validator
if tick < 0
  tick = 0
  
//todo: cache formatter's stack and compare with last returned string to prevent recalculations
//todo: game utils object

var T = tick;
var t = T mod 1000;
var S = T div 1000;
var s = S mod 60;
var M = S div 60;
var m = M mod 60;
var H = M div 60;
var h = H mod 24;

var str = '';
for (var i=1; i<=string_length(format); i++) {
  switch string_char_at(format, i) {
    case 'H':
      str+= string(H)
      break;
    case 'h':
      if h < 10
        str+= '0'
      str+= string(h)
      break;
    case 'M':
      str+= string(M)
      break;
    case 'm':
      if m < 10
        str+= '0'
      str+= string(m)
      break;
    case 'S':
      str+= string(S)
      break;
    case 's':
      if s < 10
        str+= '0'
      str+= string(s)
      break;
    case 'T':
      str+= string(T)
      break;
    case '1':
      str+= string(t div 100)
      break;
    case '2':
      str+= string(t div 10)
      break;
    case '3':
      str+= string(t)
      break;
    default:
      str+= string_char_at(format, i)
    }
  }
  
return str
