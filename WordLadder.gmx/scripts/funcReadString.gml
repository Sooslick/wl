var f = argument[0]; //opened file
var l;
if argument_count > 1
    l = argument[1]
else
    l = file_bin_read_byte(f)   //string length
var s = '';                       //string
for (var i=0; i<l; i++)
  s+= chr(file_bin_read_byte(f))
return s
