var m = argument0;   //argument 0: data hashmap
var f = file_bin_open('profiles/lastlogin.dat',0);
var s = '';
var l;

//first field: saved pnetid
m[?'PNETID'] = funcReadLong(f);

//second field: saved name
l = file_bin_read_byte(f);
for (var i=0; i<l; i++)
  s+= chr(file_bin_read_byte(f));
m[?'LOGIN'] = s
s = ''

//third field: saved pw
l = file_bin_read_byte(f);
for (var i=0; i<l; i++)
  s+= chr(file_bin_read_byte(f));
m[?'PW'] = s
s = ''

//last field: saved at
l = file_bin_read_byte(f);
for (var i=0; i<l; i++)
  s+= chr(file_bin_read_byte(f));
m[?'AT'] = s

//bool fields: save pw + autolog
m[?'SAVEPW'] = file_bin_read_byte(f);
m[?'AUTOLOG'] = file_bin_read_byte(f);

file_bin_close(f)
