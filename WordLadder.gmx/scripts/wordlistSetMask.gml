with argument0 {    //arg0: wl obj
  Mask = argument1
  Pos = -1
  if Mask == ''
    exit
  //change pos
  for (var i=Words-1; i>=0; i--) {
    if string_length(Arr[i]) < parent.MinLen
      continue
    if Mask == string_copy(Arr[i], 1,string_length(Mask)) {
      Pos = i
      break
      }
    }
  }
