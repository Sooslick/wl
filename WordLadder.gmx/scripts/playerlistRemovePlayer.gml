//arg0: plrlist
//arg1: plrid
with argument0 {
  var swap = false;
  for (var i=0; i<Players-1; i++) {
    if swap
      PlsArr[i] = PlsArr[i+1]
    else if PlsArr[i] == argument1 {
      PlsArr[i] = PlsArr[i+1]
      swap = true
      }
    }
  }
