var f = file_bin_open('profiles/lastlogin.dat',1);
var s = '';
var l;

//first field: saved pnetid
funcWriteLong(f, real(global.userdata[?'PNETID']));

//second field: saved name
l = string_length(global.userdata[?'LOGIN'])
file_bin_write_byte(f,l)
for (var i=1; i<=l; i++)
  file_bin_write_byte(f, ord(string_char_at(global.userdata[?'LOGIN'], i)))

//third field: saved pw
if global.userdata[?'SAVEPW'] > 0
  l = string_length(global.userdata[?'PW'])
else
  l = 0
file_bin_write_byte(f,l)
for (var i=1; i<=l; i++)
  file_bin_write_byte(f, ord(string_char_at(global.userdata[?'PW'], i)))

//last field: saved at
if global.userdata[?'AUTOLOG'] > 0
  l = string_length(global.userdata[?'AT'])
else
  l = 0
file_bin_write_byte(f,l)
for (var i=1; i<=l; i++)
  file_bin_write_byte(f, ord(string_char_at(global.userdata[?'AT'], i)))

//bool fields: save pw + autolog
if global.userdata[?'SAVEPW'] > 0
  file_bin_write_byte(f, irandom_range(1,250))
else 
  file_bin_write_byte(f,0)
if global.userdata[?'AUTOLOG'] > 0
  file_bin_write_byte(f, irandom_range(1,250))
else 
  file_bin_write_byte(f,0)

file_bin_close(f)

funcLogString('CredWrite')
