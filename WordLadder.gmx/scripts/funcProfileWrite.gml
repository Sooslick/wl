//check PROFILE_STRUCT README 4 ADDITIONAL INFO

    //PLAYER NET ID
    f = file_bin_open('profiles/' + global.config[?'ProfileFile'] + '.save',1)
    file_bin_write_byte(f,0)
    file_bin_write_byte(f,0)
    file_bin_write_byte(f,0)
    file_bin_write_byte(f,1)        //4 bytes: version
    funcWriteLong(f,global.profile[?'PNETID'])
      
    //PLAYER NAME
    tmp = string_length(global.profile[?'PNAME'])
    file_bin_write_byte(f,tmp)
    for (i=1;i<=tmp;i++)
    file_bin_write_byte(f,ord(string_char_at(global.profile[?'PNAME'],i)))
        
    //LOCALE:             
    file_bin_write_byte(f,global.profile[?'PLOCALE'])
    
    //STATS:                    //writing numbers from starshiy to mladshiy razryads
    funcWriteLong(f,global.profile[?'PSINGAMETIME'])
    funcWriteLong(f,global.profile[?'PSPLAYTIME'])
    funcWriteLong(f,global.profile[?'PSONLINETIME'])
    funcWriteLong(f,global.profile[?'PSWORDS'])
    funcWriteLong(f,global.profile[?'PSINPUTS'])
    funcWriteLong(f,global.profile[?'PSLETTERS'])
    funcWriteLong(f,global.profile[?'PSLETTERSA'])
    funcWriteLong(f,global.profile[?'PSLETTERSB'])
    funcWriteLong(f,global.profile[?'PSHINTS'])
    funcWriteLong(f,global.profile[?'PSSHIFTSA'])
    funcWriteLong(f,global.profile[?'PSSHIFTSU'])
    funcWriteLong(f,global.profile[?'PSBANNED'])
    funcWriteLong(f,global.profile[?'PSUNBANSA'])
    funcWriteLong(f,global.profile[?'PSUNBANSU'])
    funcWriteLong(f,global.profile[?'PSBANTYPED'])
    funcWriteLong(f,global.profile[?'PSSHORTTYPED'])
    funcWriteLong(f,global.profile[?'PSWRONGTYPED'])
    funcWriteLong(f,global.profile[?'PSREPTYPED'])
    funcWriteLong(f,global.profile[?'PSGAMES'])
    funcWriteLong(f,global.profile[?'PSENDS'])
    funcWriteLong(f,global.profile[?'PSSERVERS'])
    funcWriteLong(f,global.profile[?'PSRESETS'])
    
    //SECTIONS:
    file_bin_write_byte(f,0)
      
    file_bin_close(f)
