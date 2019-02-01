//argument0: elem x
//argument1: elem y
var ex = argument[0];
var ey = argument[1];
var ew, eh;
if argument_count > 2 {
  ew = argument[2]*dsc
  eh = argument[3]*dsc
  }
else {
  ew = 256*dsc
  eh = 64*dsc
  }
if funcCheckGuiHover(ex-ew, ey-eh, ex+ew, ey+eh)    
        {
        hover = 1            //check cursor pos not by mouse enter/leave event
        if clickable {  
          hintTick++    
          a = 1    
          }
        else
          a = 0.5 
        if hintTick > 42 {
          hint = true   
          depth = StartDepth - 2
          }       
        }
else
        {
        hover = 0
        if clickable    
          a = 0.66
        else
          a = 0.25
        hint = false
        hintTick = 0
        depth = StartDepth
        }
