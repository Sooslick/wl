    //GAME LOGO
    f = file_text_open_write(global.cfg)
    s = 'ShowLogo='
      if global.ShowLogo
        s+= 'true'
      else
        s+= 'false'
    file_text_write_string(f,s)
    file_text_writeln(f)
      
    //FIRST LAUNCH
    s = 'FirstLaunch='
      if global.FirstLaunch
        s+= 'true'
      else
        s+= 'false'
    file_text_write_string(f,s)
    file_text_writeln(f)
        
    //PROFILE SELECTOR
    s = 'Profile=' + global.Profile
    file_text_write_string(f,s)
    file_text_writeln(f)
        
    //SCREEN CONFIG
    s = 'ScreenW=' + string(global.WIN_WIDTH)
    file_text_write_string(f,s)
    file_text_writeln(f)
    
    s = 'ScreenH=' + string(global.WIN_HEIGHT)
    file_text_write_string(f,s)
    file_text_writeln(f)
    
    s = 'Fullscreen='
      if global.FULL
        s+= 'true'
      else
        s+= 'false'
    file_text_write_string(f,s)
    file_text_writeln(f)
    
    //Sound CFG
    s = 'MasterVolume=' + string(global.Master)
    file_text_write_string(f,s)
    file_text_writeln(f)
    
    s = 'SoundVolume=' + string(global.Sound)
    file_text_write_string(f,s)
    file_text_writeln(f)
    
    s = 'MusicVolume=' + string(global.Music)
    file_text_write_string(f,s)
    file_text_writeln(f)
    
    file_text_close(f)
