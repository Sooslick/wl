//esc button here
if keyboard_check_pressed(vk_escape) {
  drawRules = false
  paused = !paused
  if paused {
    if BStart != -1 {
      BStart.clickable = false
      BStart.depth = 3
      BStart.StartDepth = 3
      }
    //create pausemenu buttons
    bBack = instance_create(325,1075,oButton)
    bBack.content = 'QUIT'
    bBack.dsc = 0.75
    bBack.tsc = 0.66
    bBack.parent = id
    bEnd = instance_create(775,1075,oButton)
    bEnd.content = 'END GAME'
    bEnd.dsc = 0.75
    bEnd.tsc = 0.66
    bEnd.parent = id
    }
  else {
    if BStart != -1 {
      BStart.clickable = true
      BStart.depth = 0
      BStart.StartDepth = 0
      }
    //destroy pausemenu buttons
    instance_destroy(bBack, true)
    bBack = -1
    instance_destroy(bEnd, true)
    bEnd = -1
    }
  exit
  }

if paused
  exit

if !prepared
  exit
  
if Cube.Rot
  exit 
  
if keyboard_check_pressed(vk_enter) {
  event_user(argument0)
  exit
  }
      
//backspacing
if keyboard_check_pressed(vk_backspace) {    
  if string_length(currWord) > 1 {                               //todo ingame cursor
    currWord = string_copy(currWord,1,string_length(currWord)-1)
    Stat.lettersb++
    }
  Cube.TabuErr = false      //reset tabu err if enabled
  Cube.TabuErrNum = -1
  }
  
//switch Unban ability
else if keyboard_check_pressed(vk_tab) && Abil.Value[2] > 0 {
  if TT {
    TTNum++
    if TTNum == ds_list_size(l.TabuList) {
      TTNum = -1
      TT = false
      }
    }
  else {
    TT = true
    TTNum = 0
    }
  }
  
//switch Shift abil
else if keyboard_check_pressed(vk_up) {
  if Shift {
    Shift = false
    currWord = string_char_at(prevWord, string_length(prevWord))
    Cube.w1 = currWord
    Cube.NewWord = true
    Cube.Shifted = false
    }
  }
else if keyboard_check_pressed(vk_down) {
  if !Shift {
    Shift = true
    currWord = string_char_at(prevWord, string_length(prevWord)-1)
    Cube.w1 = currWord
    Cube.NewWord = true
    Cube.Shifted = true
    }
  }
//anykey: force EN layout
else if (keyboard_lastkey >= 65) && (keyboard_lastkey <= 90) {
  currWord+= chr(keyboard_lastkey)
  keyboard_lastkey = -1
  Stat.letters++
  }
//TODO: LOCALE!!!!! ! ! !
else {
  keyboard_lastchar = string_upper(keyboard_lastchar)
  if (ord(keyboard_lastchar)>64)&&(ord(keyboard_lastchar)<91) {
    currWord+= keyboard_lastchar
    Stat.letters++
    }
  keyboard_lastchar = ''                //reset lastchar if next key is ctrl, alt or similar...
  }

Cube.w1 = currWord  
Cube.NewWord = true
wordlistSetMask(wl, currWord)
