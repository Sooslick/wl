//check PROFILE_STRUCT README 4 ADDITIONAL INFO

    //PLAYER NET ID
    f = file_bin_open('profiles/' + global.Profile + '.save',1)
    file_bin_write_byte(f,global.PNETID)
      
    //PLAYER NAME
    tmp = string_length(global.PNAME)
    file_bin_write_byte(f,tmp)
    for (i=1;i<=tmp;i++)
    file_bin_write_byte(f,ord(string_char_at(global.PNAME,i)))
        
    //LOCALE:             
    file_bin_write_byte(f,global.PLOCALE)
    
    //STATS:                    //writing numbers from starshiy to mladshiy razryads
    tmp = global.PSINGAMETIME       
    for (i=0;i<4;i++)
      {
      byte[i] = tmp mod 256
      tmp = tmp div 256
      }
    for (i=3; i>=0; i--)
      file_bin_write_byte(f,byte[i])
    
    tmp = global.PSPLAYTIME      
    for (i=0;i<4;i++)
      {
      byte[i] = tmp mod 256
      tmp = tmp div 256
      }
    for (i=3; i>=0; i--)
      file_bin_write_byte(f,byte[i])
      
    tmp = global.PSONLINETIME      
    for (i=0;i<4;i++)
      {
      byte[i] = tmp mod 256
      tmp = tmp div 256
      }
    for (i=3; i>=0; i--)
      file_bin_write_byte(f,byte[i])
      
    tmp = global.PSWORDS     
    for (i=0;i<4;i++)
      {
      byte[i] = tmp mod 256
      tmp = tmp div 256
      }
    for (i=3; i>=0; i--)
      file_bin_write_byte(f,byte[i])
      
    tmp = global.PSLETTERS      
    for (i=0;i<4;i++)
      {
      byte[i] = tmp mod 256
      tmp = tmp div 256
      }
    for (i=3; i>=0; i--)
      file_bin_write_byte(f,byte[i])
      
    tmp = global.PSGAMES     
    for (i=0;i<4;i++)
      {
      byte[i] = tmp mod 256
      tmp = tmp div 256
      }
    for (i=3; i>=0; i--)
      file_bin_write_byte(f,byte[i])
      
    tmp = global.PSSERVERS      
    for (i=0;i<4;i++)
      {
      byte[i] = tmp mod 256
      tmp = tmp div 256
      }
    for (i=3; i>=0; i--)
      file_bin_write_byte(f,byte[i])    
    
    tmp = global.PSRESETS     
    for (i=0;i<4;i++)
      {
      byte[i] = tmp mod 256
      tmp = tmp div 256
      }
    for (i=3; i>=0; i--)
      file_bin_write_byte(f,byte[i])   
      
    file_bin_close(f)
