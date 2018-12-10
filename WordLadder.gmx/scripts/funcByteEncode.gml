//returns string: 00..ff
//arg0: byte
var a = argument0 div 16;
var s = '';
switch a {
  case 10: s='a'; break;
  case 11: s='b'; break;
  case 12: s='c'; break;
  case 13: s='d'; break;
  case 14: s='e'; break;
  case 15: s='f'; break;
  default: s= string(a);
  }
a = argument0 mod 16;
switch a {
  case 10: s+='a'; break;
  case 11: s+='b'; break;
  case 12: s+='c'; break;
  case 13: s+='d'; break;
  case 14: s+='e'; break;
  case 15: s+='f'; break;
  default: s+= string(a);
  }
return s
