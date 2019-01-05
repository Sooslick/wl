//argument0: wl
//argument1: word
//argument2: animation boolean
with argument0 {
  for (var i=0; i<Words; i++)
    if Arr[i] == argument1 {
      Anim = argument2
      return true
    }
  }
return false
