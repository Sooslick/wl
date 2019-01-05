var percent = argument0;
//TODO locale!
var vowels = 'AEIOUY';
var cons = 'QWRTPSDFGHJKLZXCVBNM';
if random(100)<percent
  return string_char_at(vowels,irandom_range(1,string_length(vowels)))
else
  return string_char_at(cons,irandom_range(1,string_length(cons)))
