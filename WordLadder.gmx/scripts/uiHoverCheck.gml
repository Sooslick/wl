//argument0: elem x
//argument1: elem y
if funcCheckGuiHover((argument0-256*dsc), (argument1-64*dsc), (argument0+256*dsc), (argument1+64*dsc))    
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
