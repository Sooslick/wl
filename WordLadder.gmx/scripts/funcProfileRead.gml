//check PROFILE_STRUCT README 4 ADDITIONAL INFO
if file_exists('profiles/' + global.Profile + '.save')
    {
    //PLAYER NET ID
    f = file_bin_open('profiles/' + global.Profile + '.save',0)
    s = file_bin_read_byte(f)
    global.PNETID = s
      
    //PLAYER NAME
    s = file_bin_read_byte(f)
    tmp = ''
    for (i=0;i<s;i++)
      tmp+= chr(file_bin_read_byte(f))
    global.PNAME = tmp
        
    //LOCALE:                       //0 eng; 1 ru
    s = file_bin_read_byte(f)
    global.PLOCALE = s
    
    //STAT: TIMERS
    global.PSINGAMETIME = 0
    for (i=0; i<4; i++)
      global.PSINGAMETIME = global.PSINGAMETIME*256 + file_bin_read_byte(f)
      
    global.PSPLAYTIME = 0
    for (i=0; i<4; i++)
      global.PSPLAYTIME = global.PSPLAYTIME*256 + file_bin_read_byte(f)
    
    global.PSONLINETIME = 0
    for (i=0; i<4; i++)
      global.PSONLINETIME = global.PSONLINETIME*256 + file_bin_read_byte(f)  
      
    //STAT: game  
    global.PSWORDS = 0
    for (i=0; i<4; i++)
      global.PSWORDS = global.PSWORDS*256 + file_bin_read_byte(f)
      
    global.PSLETTERS = 0
    for (i=0; i<4; i++)
      global.PSLETTERS = global.PSLETTERS*256 + file_bin_read_byte(f)  
      
    global.PSGAMES = 0
    for (i=0; i<4; i++)
      global.PSGAMES = global.PSGAMES*256 + file_bin_read_byte(f)   
      
    global.PSSERVERS = 0
    for (i=0; i<4; i++)
      global.PSSERVERS = global.PSSERVERS*256 + file_bin_read_byte(f)   
      
    file_bin_close(f)
    }
else
    {
    global.PNETID = -1
    global.PNAME = 'SAVE CORRUPTED'
    global.PLOCALE = 0
    
    global.PSINGAMETIME = 0
    global.PSPLAYTIME = 0
    global.PSONLINETIME = 0
    global.PSWORDS = 0
    global.PSLETTERS = 0
    global.PSGAMES = 0
    global.PSSERVERS = 0
    
    global.SaveCorrupted = true
    }
