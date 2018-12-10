var f = argument0; //opened file
var l = file_bin_read_byte(f)   //string length
var s = '';                       //string
for (var i=0; i<l; i++)
  s+= chr(file_bin_read_byte(f))
return s
