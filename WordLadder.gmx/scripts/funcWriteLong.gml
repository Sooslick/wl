//argument 0: opened file
//argument 1: long
var f = argument0;
var l = argument1 ;    
    for (i=0;i<4;i++)
      {
      byte[i] = l mod 256
      l = l div 256
      }
    for (i=3; i>=0; i--)
      file_bin_write_byte(f,byte[i])
