//argument0: save path
//return: ts or -1 if failed

if file_exists(argument0) {
  var f = file_bin_open(argument0,0);
  if file_bin_size(f)>12 {
    file_bin_seek(f,4)
    var ts = funcReadLong(f);
    file_bin_close(f);
    return ts
    }
  //file too short
  else {
    file_bin_close(f)
    return -1
    }
  }
//file not exists
else return -1
