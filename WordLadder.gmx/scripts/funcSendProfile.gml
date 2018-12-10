if global.userdata[?'PNETID'] <= 0
  exit
  
if !file_exists('profiles/' + global.config[?'ProfileFile'] + '.save')
  exit

var sendto = global.domain+'wl/saveFile.php?access_token=' + global.userdata[?'AT'];
var bytes = '';
var f = file_bin_open('profiles/' + global.config[?'ProfileFile'] + '.save',0);
var b = 0;
while file_bin_position(f) < file_bin_size(f) {
  b = file_bin_read_byte(f)
  bytes+= funcByteEncode(b)
  }
file_bin_close(f)
/*
f = file_text_open_write('log.txt')
file_text_write_string(f, bytes)
file_text_close(f)
*/
bytes='bytes=' + bytes
http_post_string(sendto, bytes)
