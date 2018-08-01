var s = argument0;
var s1 = '';
for (i=1; i<=string_length(s); i++)
  {
  if string_char_at(s,i) == 'x'
    {
    global.WIN_WIDTH = real(s1)
    s1 = ''
    }
  else
    s1+= string_char_at(s,i)
  }
global.WIN_HEIGHT = real(s1)
