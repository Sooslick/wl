//MEGATODO: REFACTOR w/ gameAnykeySolo !!!
//dublicate >95% of code

//esc button here
if keyboard_check_pressed(vk_escape) {
  paused = funcBoolSwitch(paused)
  if paused {
    bBack = instance_create(325,1075,oButton)
    bBack.content = 'DISCONNECT'
    bBack.dsc = 0.75
    bBack.tsc = 0.66
    bBack.parent = id
    }
  else {
    instance_destroy(bBack, true)
    bBack = -1
    }
  exit
  }

if paused
  exit

if !prepared
  exit
  
if drawRules
  exit  
  
if Cube.Rot
  exit
  
if Cube.ApplyBw
  exit
  
if Net.Chat.Active      //todo perenesti Chat constructor to GR
  exit
  
if waiting
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
//prevent too long word
else if (string_length(currWord)-1 == MinLen) && MinLen < 14
  exit
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
with Net event_user(1)            //trigger input event on client object
