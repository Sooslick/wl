    //GAME LOGO
    f = file_text_open_write(global.cfg)
    s = 'ShowLogo='
      if global.config[?'ShowLogo']
        s+= 'true'
      else
        s+= 'false'
    file_text_write_string(f,s)
    file_text_writeln(f)
      
    //FIRST LAUNCH
    s = 'FirstLaunch='
      if global.config[?'FirstLaunch']
        s+= 'true'
      else
        s+= 'false'
    file_text_write_string(f,s)
    file_text_writeln(f)
        
    //PROFILE SELECTOR
    s = 'ProfileFile=' + global.config[?'ProfileFile']
    file_text_write_string(f,s)
    file_text_writeln(f)
        
    //SCREEN CONFIG
    s = 'ScreenW=' + string(global.config[?'ScreenW'])
    file_text_write_string(f,s)
    file_text_writeln(f)
    
    s = 'ScreenH=' + string(global.config[?'ScreenH'])
    file_text_write_string(f,s)
    file_text_writeln(f)
    
    s = 'Fullscreen='
      if global.config[?'Fullscreen']
        s+= 'true'
      else
        s+= 'false'
    file_text_write_string(f,s)
    file_text_writeln(f)
    
    s = 'Widescreen='
      if global.config[?'Widescreen']
        s+= 'true'
      else
        s+= 'false'
    file_text_write_string(f,s)
    file_text_writeln(f)
    
    //loc
    s = 'Localization=' + string(global.config[?'Localization'])
    file_text_write_string(f,s)
    file_text_writeln(f)
    
    //Sound CFG
    s = 'MasterVolume=' + string(global.config[?'Master'])
    file_text_write_string(f,s)
    file_text_writeln(f)
    
    s = 'SoundVolume=' + string(global.config[?'Sound'])
    file_text_write_string(f,s)
    file_text_writeln(f)
    
    s = 'MusicVolume=' + string(global.config[?'Music'])
    file_text_write_string(f,s)
    file_text_writeln(f)
    
    s = 'SavedIP=' + global.config[?'SavedIP']
    file_text_write_string(f,s)
    file_text_writeln(f)
    
    s = 'ExtraDictVer=' + string(global.config[?'ExtraDict'])
    file_text_write_string(f,s)
    file_text_writeln(f)
    
    file_text_close(f)
