if file_exists(global.cfg)
    {
    //GAME LOGO
    f = file_text_open_read(global.cfg)
    s = file_text_read_string(f)
    if string_copy(s,1,9) = 'ShowLogo='
      if string_copy(s,10,5) = 'false'
        global.config[?'ShowLogo'] = false
      else
        global.config[?'ShowLogo'] = true
    else
      global.config[?'ShowLogo'] = true
    file_text_readln(f)
      
    //FIRST LAUNCH
    s = file_text_read_string(f)
    if string_copy(s,1,12) = 'FirstLaunch='
      if string_copy(s,13,5) = 'false'
        global.config[?'FirstLaunch'] = false
      else
        global.config[?'FirstLaunch'] = true
    else
      global.config[?'FirstLaunch'] = true
    file_text_readln(f)  
        
    //PROFILE SELECTOR
    s = file_text_read_string(f)
    if string_copy(s,1,8) = 'Profile='
      global.config[?'ProfileFile'] = string_delete(s,1,8)
    else
      global.config[?'ProfileFile'] = 'anonymous'       //default profile FIX PLZ
    file_text_readln(f)
        
    //SCREEN CONFIG
    s = file_text_read_string(f)
    if string_copy(s,1,8) = 'ScreenW='
      global.WIN_WIDTH = real(string_delete(s,1,8))
    else
      global.WIN_WIDTH = display_get_width()
    file_text_readln(f)
    
    s = file_text_read_string(f)
    if string_copy(s,1,8) = 'ScreenH='
      global.WIN_HEIGHT = real(string_delete(s,1,8))
    else
      global.WIN_HEIGHT = display_get_height()
    file_text_readln(f)
    
    s = file_text_read_string(f)
    if string_copy(s,1,11) = 'Fullscreen='
      if string_copy(s,12,5) = 'false'
        global.config[?'Fullscreen'] = false
      else
        global.config[?'Fullscreen'] = true
    else
      global.config[?'Fullscreen'] = true
    file_text_readln(f)
    
    s = file_text_read_string(f)
    if string_copy(s,1,11) = 'Widescreen='
      if string_copy(s,12,5) = 'false'
        global.config[?'Widescreen'] = false
      else
        global.config[?'Widescreen'] = true
    else
      global.config[?'Widescreen'] = false
    file_text_readln(f)
    
    //Localization: 0 - en; 1 - ru //TODO localization strings
    s = file_text_read_string(f)
    if string_copy(s,1,13) = 'Localization='
      {
      global.config[?'Localization'] = real(string_delete(s,1,13))
      if global.config[?'Localization']<0 || global.config[?'Localization']>1
        global.config[?'Localization'] = 0
      }
    else
      global.config[?'Localization'] = 0
    file_text_readln(f)
    
    //Volume CFG
    s = file_text_read_string(f)
    if string_copy(s,1,13) = 'MasterVolume='
      {
      global.config[?'Master'] = real(string_delete(s,1,13))
      if global.config[?'Master']<0 || global.config[?'Master']>100
        global.config[?'Master'] = 100
      }
    else
      global.config[?'Master'] = 100
    file_text_readln(f)
    
    s = file_text_read_string(f)
    if string_copy(s,1,12) = 'SoundVolume='
      {
      global.config[?'Sound'] = real(string_delete(s,1,12))
      if global.config[?'Sound']<0 || global.config[?'Sound']>100
        global.config[?'Sound'] = 100
      }
    else
      global.config[?'Sound'] = 100
    file_text_readln(f)
    
    s = file_text_read_string(f)
    if string_copy(s,1,12) = 'MusicVolume='
      {
      global.config[?'Music'] = real(string_delete(s,1,12))
      if global.config[?'Music']<0 || global.config[?'Music']>100
        global.config[?'Music'] = 100
      }
    else
      global.config[?'Music'] = 100
    file_text_readln(f)
    
    s = file_text_read_string(f)
    if string_copy(s,1,8) = 'SavedIP='
      global.config[?'SavedIP'] = string_delete(s,1,8)
    else
      global.config[?'SavedIP'] = '127.0.0.1'
    file_text_readln(f)
    
    file_text_close(f)
    }
else                //defaults
    {
    global.config[?'ShowLogo'] = true
    global.config[?'FirstLaunch'] = true
    global.config[?'ProfileFile'] = 'noob'
    global.WIN_WIDTH = display_get_width()
    global.WIN_HEIGHT = display_get_height()
    global.config[?'Fullscreen'] = true
    global.config[?'Widescreen'] = true
    global.config[?'Localization'] = 0
    global.config[?'Master'] = 100
    global.config[?'Sound'] = 100
    global.config[?'Music'] = 100
    global.config[?'SavedIP'] = '127.0.0.1'
    }
    
if global.config[?'Fullscreen']
  {
  global.WIN_WIDTH = display_get_width()
  global.WIN_HEIGHT = display_get_height()
  }
