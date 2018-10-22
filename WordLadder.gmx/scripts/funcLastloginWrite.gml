var m = argument0;   //argument 0: data hashmap
var f = file_bin_open('profiles/lastlogin.dat',1);
var s = '';
var l;

//first field: saved pnetid
funcWriteLong(f, real(m[?'PNETID']));

//second field: saved name
l = string_length(m[?'LOGIN'])
file_bin_write_byte(f,l)
for (var i=1; i<=l; i++)
  file_bin_write_byte(f, ord(string_char_at(m[?'LOGIN'], i)))

//third field: saved pw
if m[?'SAVEPW'] > 0
  l = string_length(m[?'PW'])
else
  l = 0
file_bin_write_byte(f,l)
for (var i=1; i<=l; i++)
  file_bin_write_byte(f, ord(string_char_at(m[?'PW'], i)))

//last field: saved at
if m[?'AUTOLOG'] > 0
  l = string_length(global.at)
else
  l = 0
file_bin_write_byte(f,l)
for (var i=1; i<=l; i++)
  file_bin_write_byte(f, ord(string_char_at(global.at, i)))

//bool fields: save pw + autolog
if m[?'SAVEPW'] > 0
  file_bin_write_byte(f, irandom_range(1,250))
else 
  file_bin_write_byte(f,0)
if m[?'AUTOLOG'] > 0
  file_bin_write_byte(f, irandom_range(1,250))
else 
  file_bin_write_byte(f,0)

file_bin_close(f)
