//check PROFILE_STRUCT README 4 ADDITIONAL INFO

    //PLAYER NET ID
    f = file_bin_open('profiles/' + global.config[?'ProfileFile'] + '.save',1)
    file_bin_write_byte(f,global.profile[?'PNETID'])
      
    //PLAYER NAME
    tmp = string_length(global.profile[?'PNAME'])
    file_bin_write_byte(f,tmp)
    for (i=1;i<=tmp;i++)
    file_bin_write_byte(f,ord(string_char_at(global.profile[?'PNAME'],i)))
        
    //LOCALE:             
    file_bin_write_byte(f,global.profile[?'PLOCALE'])
    
    //STATS:                    //writing numbers from starshiy to mladshiy razryads
    tmp = global.profile[?'PSINGAMETIME']     
    for (i=0;i<4;i++)
      {
      byte[i] = tmp mod 256
      tmp = tmp div 256
      }
    for (i=3; i>=0; i--)
      file_bin_write_byte(f,byte[i])
    
    tmp = global.profile[?'PSPLAYTIME']      
    for (i=0;i<4;i++)
      {
      byte[i] = tmp mod 256
      tmp = tmp div 256
      }
    for (i=3; i>=0; i--)
      file_bin_write_byte(f,byte[i])
      
    tmp = global.profile[?'PSONLINETIME']     
    for (i=0;i<4;i++)
      {
      byte[i] = tmp mod 256
      tmp = tmp div 256
      }
    for (i=3; i>=0; i--)
      file_bin_write_byte(f,byte[i])
      
    tmp = global.profile[?'PSWORDS']    
    for (i=0;i<4;i++)
      {
      byte[i] = tmp mod 256
      tmp = tmp div 256
      }
    for (i=3; i>=0; i--)
      file_bin_write_byte(f,byte[i])
      
    tmp = global.profile[?'PSLETTERS']      
    for (i=0;i<4;i++)
      {
      byte[i] = tmp mod 256
      tmp = tmp div 256
      }
    for (i=3; i>=0; i--)
      file_bin_write_byte(f,byte[i])
      
    tmp = global.profile[?'PSGAMES']    
    for (i=0;i<4;i++)
      {
      byte[i] = tmp mod 256
      tmp = tmp div 256
      }
    for (i=3; i>=0; i--)
      file_bin_write_byte(f,byte[i])
      
    tmp = global.profile[?'PSSERVERS']      
    for (i=0;i<4;i++)
      {
      byte[i] = tmp mod 256
      tmp = tmp div 256
      }
    for (i=3; i>=0; i--)
      file_bin_write_byte(f,byte[i])    
    
    tmp = global.profile[?'PSRESETS']    
    for (i=0;i<4;i++)
      {
      byte[i] = tmp mod 256
      tmp = tmp div 256
      }
    for (i=3; i>=0; i--)
      file_bin_write_byte(f,byte[i])   
      
    file_bin_close(f)
