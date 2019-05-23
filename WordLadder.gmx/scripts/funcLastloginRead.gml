var s = '';
var l;

if file_exists('profiles/lastlogin.dat')
{
  var f = file_bin_open('profiles/lastlogin.dat',0);
  
  //first field: saved pnetid
  global.userdata[?'PNETID'] = funcReadLong(f);
  
  //second field: saved name
  l = file_bin_read_byte(f);
  for (var i=0; i<l; i++)
    s+= chr(file_bin_read_byte(f));
  global.userdata[?'LOGIN'] = s
  s = ''
  
  //third field: saved pw
  l = file_bin_read_byte(f);
  for (var i=0; i<l; i++)
    s+= chr(file_bin_read_byte(f));
  global.userdata[?'PW'] = s
  s = ''
  
  //last field: saved at
  l = file_bin_read_byte(f);
  for (var i=0; i<l; i++)
    s+= chr(file_bin_read_byte(f));
  global.userdata[?'AT'] = s
  
  //bool fields: save pw + autolog
  global.userdata[?'SAVEPW'] = file_bin_read_byte(f);
  global.userdata[?'AUTOLOG'] = file_bin_read_byte(f);
  
  file_bin_close(f)
}

else
{
  global.userdata[?'PNETID'] = -1
  global.userdata[?'LOGIN'] = ''
  global.userdata[?'PW'] = ''
  global.userdata[?'AT'] = ''
  global.userdata[?'SAVEPW'] = 0
  global.userdata[?'AUTOLOG'] = 0
}

global.userdata[?'SAVEPATH'] = ''
//TODO check data valid

funcLogString('CredRead')
