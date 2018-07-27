//argument 0: opened file
f = argument0
l = 0
//TODO: check end of file
for (i=0; i<4; i++)
  l = l*256 + file_bin_read_byte(f)
return l
