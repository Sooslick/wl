//check PROFILE_STRUCT README 4 ADDITIONAL INFO
if file_exists('profiles/' + global.config[?'ProfileFile'] + '.save')
    {
    f = file_bin_open('profiles/' + global.config[?'ProfileFile'] + '.save',0)
    //SAVE HEADER
    v[0] = file_bin_read_byte(f)
    v[1] = file_bin_read_byte(f)
    v[2] = file_bin_read_byte(f)
    v[3] = file_bin_read_byte(f)
    if v[0] == 0 && v[1] == 0 && v[2] == 0 && v[3] == 2
        {
        //PLAYER NET ID
        global.profile[?'PNETID'] = funcReadLong(f)
      
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
        global.profile[?'PSINGAMETIME'] = funcReadLong(f)
        global.profile[?'PSPLAYTIME'] = funcReadLong(f)
        global.profile[?'PSONLINETIME'] = funcReadLong(f)
        
        //STAT: game's overall
        global.profile[?'PSWORDS'] = funcReadLong(f)
        global.profile[?'PSINPUTS'] = funcReadLong(f)
        global.profile[?'PSLETTERS'] = funcReadLong(f)
        global.profile[?'PSLETTERSA'] = funcReadLong(f)
        global.profile[?'PSLETTERSB'] = funcReadLong(f)
        global.profile[?'PSHINTS'] = funcReadLong(f)
        global.profile[?'PSSHIFTSA'] = funcReadLong(f)
        global.profile[?'PSSHIFTSU'] = funcReadLong(f)
        global.profile[?'PSBANNED'] = funcReadLong(f)
        global.profile[?'PSUNBANSA'] = funcReadLong(f)
        global.profile[?'PSUNBANSU'] = funcReadLong(f)
        global.profile[?'PSBANTYPED'] = funcReadLong(f)
        global.profile[?'PSSHORTTYPED'] = funcReadLong(f)
        global.profile[?'PSWRONGTYPED'] = funcReadLong(f)
        global.profile[?'PSREPTYPED'] = funcReadLong(f)
        global.profile[?'PSGAMES'] = funcReadLong(f)
        global.profile[?'PSENDS'] = funcReadLong(f)
        global.profile[?'PSSERVERS'] = funcReadLong(f)
        global.profile[?'PSRESETS'] = funcReadLong(f)
        
        //STAT: GAME SECTIONS
        s = file_bin_read_byte(f)
        for (i=0; i<s; i++)
          {
          //TODO: Read section's header
          //TODO: create section's map
          //TODO: Read section's fields
          //TODO: write section
          }
        file_bin_close(f)
        return true;
        }        
    file_bin_close(f)
    }
global.profile[?'PNETID'] = -1
global.profile[?'PNAME'] = 'SAVE CORRUPTED'
global.profile[?'PLOCALE'] = 0
    
global.profile[?'PSINGAMETIME'] = 0
global.profile[?'PSPLAYTIME'] = 0
global.profile[?'PSONLINETIME'] = 0
global.profile[?'PSWORDS'] = 0
global.profile[?'PSINPUTS'] = 0
global.profile[?'PSLETTERS'] = 0
global.profile[?'PSLETTERSA'] = 0
global.profile[?'PSLETTERSB'] = 0
global.profile[?'PSHINTS'] = 0
global.profile[?'PSSHIFTSA'] = 0
global.profile[?'PSSHIFTSU'] = 0
global.profile[?'PSBANNED'] = 0
global.profile[?'PSUNBANSA'] = 0
global.profile[?'PSUNBANSU'] = 0
global.profile[?'PSBANTYPED'] = 0
global.profile[?'PSSHORTTYPED'] = 0
global.profile[?'PSWRONGTYPED'] = 0
global.profile[?'PSREPTYPED'] = 0
global.profile[?'PSGAMES'] = 0
global.profile[?'PSENDS'] = 0
global.profile[?'PSSERVERS'] = 0
global.profile[?'PSRESETS'] = 0
    
global.SaveCorrupted = true
return true;
