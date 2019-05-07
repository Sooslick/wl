    //GAME LOGO
    var f = file_text_open_write(global.cfg);
    var s = 'ShowLogo=' + formatBoolString(global.config[?'ShowLogo'], true);
    file_text_write_string(f,s)
    file_text_writeln(f)
      
    //FIRST LAUNCH
    s = 'FirstLaunch=' + formatBoolString(global.config[?'FirstLaunch'], true)
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
    
    s = 'Fullscreen=' + formatBoolString(global.config[?'Fullscreen'], true)
    file_text_write_string(f,s)
    file_text_writeln(f)
    
    //todo: replace widescreen to screen format
    s = 'Widescreen=' + formatBoolString(global.config[?'Widescreen'], true)
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
    
    //last server connected
    s = 'SavedIP=' + global.config[?'SavedIP']
    file_text_write_string(f,s)
    file_text_writeln(f)
    
    //version of downloaded extra.dict
    s = 'ExtraDict=' + string(global.config[?'ExtraDict'])
    file_text_write_string(f,s)
    file_text_writeln(f)
    
    //last loaded headline
    s = 'LastHeadline=' + string(global.config[?'LastHeadline'])
    file_text_write_string(f,s)
    file_text_writeln(f)
    
    //custom gamemode fields
    s = 'CustomStart=' + string(global.config[?'CustomStart'])
    file_text_write_string(f,s)
    file_text_writeln(f)
    
    s = 'CustomTimer=' + string(global.config[?'CustomTimer'])
    file_text_write_string(f,s)
    file_text_writeln(f)
    
    s = 'CustomInc=' + string(global.config[?'CustomInc'])
    file_text_write_string(f,s)
    file_text_writeln(f)
    
    s = 'CustomDec=' + string(global.config[?'CustomDec'])
    file_text_write_string(f,s)
    file_text_writeln(f)
    
    s = 'CustomUnbans=' + formatBoolString(global.config[?'CustomUnbans'],true)
    file_text_write_string(f,s)
    file_text_writeln(f)
    
    s = 'CustomShifts=' + formatBoolString(global.config[?'CustomShifts'],true)
    file_text_write_string(f,s)
    file_text_writeln(f)
    
    s = 'CustomHints=' + formatBoolString(global.config[?'CustomHints'],true)
    file_text_write_string(f,s)
    file_text_writeln(f)
    
    s = 'CustomBans=' + string(global.config[?'CustomBans'])
    file_text_write_string(f,s)
    file_text_writeln(f)
    
    s = 'CustomVowels=' + string(global.config[?'CustomVowels'])
    file_text_write_string(f,s)
    file_text_writeln(f)
    
    s = 'CustomGreens=' + string(global.config[?'CustomGreens'])
    file_text_write_string(f,s)
    file_text_writeln(f)
    
    //multiplayer gamemode fields
    s = 'MultiStart=' + string(global.config[?'MultiStart'])
    file_text_write_string(f,s)
    file_text_writeln(f)
    
    s = 'MultiTimer=' + string(global.config[?'MultiTimer'])
    file_text_write_string(f,s)
    file_text_writeln(f)
    
    s = 'MultiInc=' + string(global.config[?'MultiInc'])
    file_text_write_string(f,s)
    file_text_writeln(f)
    
    s = 'MultiDec=' + string(global.config[?'MultiDec'])
    file_text_write_string(f,s)
    file_text_writeln(f)
    
    s = 'MultiUnbans=' + formatBoolString(global.config[?'MultiUnbans'],true)
    file_text_write_string(f,s)
    file_text_writeln(f)
    
    s = 'MultiShifts=' + formatBoolString(global.config[?'MultiShifts'],true)
    file_text_write_string(f,s)
    file_text_writeln(f)
    
    s = 'MultiHints=' + formatBoolString(global.config[?'MultiHints'],true)
    file_text_write_string(f,s)
    file_text_writeln(f)
    
    s = 'MultiBans=' + string(global.config[?'MultiBans'])
    file_text_write_string(f,s)
    file_text_writeln(f)
    
    s = 'MultiVowels=' + string(global.config[?'MultiVowels'])
    file_text_write_string(f,s)
    file_text_writeln(f)
    
    s = 'MultiGreens=' + string(global.config[?'MultiGreens'])
    file_text_write_string(f,s)
    file_text_writeln(f)
    
    s = 'MultiMode=' + string(global.config[?'MultiMode'])
    file_text_write_string(f,s)
    file_text_writeln(f)
    
    s = 'ForceOffline=' + formatBoolString(global.config[?'ForceOffline'], false)
    file_text_write_string(f,s)
    file_text_writeln(f)
    
    s = 'InteractiveBg=' + formatBoolString(global.config[?'InteractiveBg'], true)
    file_text_write_string(f,s)
    file_text_writeln(f)

    file_text_close(f)
    //possible to refactor this
