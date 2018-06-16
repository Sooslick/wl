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
    
    file_bin_close(f)
    }
else
    {
    global.PNETID = -1
    global.PNAME = 'SAVE CORRUPTED'
    global.PLOCALE = 0
    global.SaveCorrupted = true
    }
