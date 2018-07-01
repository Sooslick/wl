//check PROFILE_STRUCT README 4 ADDITIONAL INFO
if file_exists('profiles/' + global.config[?'ProfileFile'] + '.save')
    {
    //PLAYER NET ID
    f = file_bin_open('profiles/' + global.config[?'ProfileFile'] + '.save',0)
    s = file_bin_read_byte(f)
    global.profile[?'PNETID'] = s
      
    //PLAYER NAME
    s = file_bin_read_byte(f)
    tmp = ''
    for (i=0;i<s;i++)
      tmp+= chr(file_bin_read_byte(f))
    global.profile[?'PNAME'] = tmp
        
    //LOCALE:                       //0 eng; 1 ru
    s = file_bin_read_byte(f)
    global.profile[?'PLOCALE'] = s
    
    //STAT: TIMERS
    global.profile[?'PSINGAMETIME'] = 0
    for (i=0; i<4; i++)
      global.profile[?'PSINGAMETIME'] = global.profile[?'PSINGAMETIME']*256 + file_bin_read_byte(f)
      
    global.profile[?'PSPLAYTIME'] = 0
    for (i=0; i<4; i++)
      global.profile[?'PSPLAYTIME'] = global.profile[?'PSPLAYTIME']*256 + file_bin_read_byte(f)
    
    global.profile[?'PSONLINETIME'] = 0
    for (i=0; i<4; i++)
      global.profile[?'PSONLINETIME'] = global.profile[?'PSONLINETIME']*256 + file_bin_read_byte(f)  
      
    //STAT: game  
    global.profile[?'PSWORDS'] = 0
    for (i=0; i<4; i++)
      global.profile[?'PSWORDS'] = global.profile[?'PSWORDS']*256 + file_bin_read_byte(f)
      
    global.profile[?'PSLETTERS'] = 0
    for (i=0; i<4; i++)
      global.profile[?'PSLETTERS'] = global.profile[?'PSLETTERS']*256 + file_bin_read_byte(f)  
      
    global.profile[?'PSGAMES'] = 0
    for (i=0; i<4; i++)
      global.profile[?'PSGAMES'] = global.profile[?'PSGAMES']*256 + file_bin_read_byte(f)   
      
    global.profile[?'PSSERVERS'] = 0
    for (i=0; i<4; i++)
      global.profile[?'PSSERVERS'] = global.profile[?'PSSERVERS']*256 + file_bin_read_byte(f)   
     
    global.profile[?'PSRESETS'] = 0
    for (i=0; i<4; i++)
      global.profile[?'PSRESETS'] = global.profile[?'PSRESETS']*256 + file_bin_read_byte(f)   
       
    file_bin_close(f)
    }
else
    {
    global.profile[?'PNETID'] = -1
    global.profile[?'PNAME'] = 'SAVE CORRUPTED'
    global.profile[?'PLOCALE'] = 0
    
    global.profile[?'PSINGAMETIME'] = 0
    global.profile[?'PSPLAYTIME'] = 0
    global.profile[?'PSONLINETIME'] = 0
    global.profile[?'PSWORDS'] = 0
    global.profile[?'PSLETTERS'] = 0
    global.profile[?'PSGAMES'] = 0
    global.profile[?'PSSERVERS'] = 0
    global.profile[?'PSRESETS'] = 0
    
    global.SaveCorrupted = true
    }
