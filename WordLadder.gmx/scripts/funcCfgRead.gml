if file_exists(global.cfg)
    {
    //GAME LOGO
    f = file_text_open_read(global.cfg)
    s = file_text_read_string(f)
    if string_copy(s,1,9) = 'ShowLogo='
      if string_copy(s,10,5) = 'false'
        global.ShowLogo = false
      else
        global.ShowLogo = true
    else
      global.ShowLogo = true
    file_text_readln(f)
      
    //FIRST LAUNCH
    s = file_text_read_string(f)
    if string_copy(s,1,12) = 'FirstLaunch='
      if string_copy(s,13,5) = 'false'
        global.FirstLaunch = false
      else
        global.FirstLaunch = true
    else
      global.FirstLaunch = true
    file_text_readln(f)  
        
    //PROFILE SELECTOR
    s = file_text_read_string(f)
    if string_copy(s,1,8) = 'Profile='
      global.Profile = string_delete(s,1,8)
    else
      global.Profile = 'noob'       //default profile FIX PLZ
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
        global.FULL = false
      else
        global.FULL = true
    else
      global.FULL = false
    file_text_readln(f)
    }
else                //defaults
    {
    global.ShowLogo = true
    global.FirstLaunch = true
    global.Profile = 'noob'
    global.WIN_WIDTH = display_get_width()
    global.WIN_HEIGHT = display_get_height()
    global.FULL = false
    }
