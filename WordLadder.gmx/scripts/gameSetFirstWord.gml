//argument: first word
if argument_count == 0
  //generate first word
  for (i=1; i<=MinLen; i++) {
    var tmp = irandom_range(0,25);     //todo CHECK LOCALE BLYA
    prevWord+= chr(funcChrDecode(tmp))
    }  
else
  prevWord = argument[0]
//cubeobj post-fixes
Cube.MinLen = MinLen
Cube.NewLen = MinLen
Cube.w1 = prevWord
