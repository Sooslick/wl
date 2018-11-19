var s = argument0;
var s1 = '';
for (i=1; i<=string_length(s); i++)
  {
  if string_char_at(s,i) == 'x'
    {
    global.config[?'ScreenW'] = real(s1)
    s1 = ''
    }
  else
    s1+= string_char_at(s,i)
  }
global.config[?'ScreenH'] = real(s1)
