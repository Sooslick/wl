//check PROFILE_STRUCT README 4 ADDITIONAL INFO
//fname = 'profiles/' + global.Profile + '.save'
//if !file_exists(fname)
//create file

    //PLAYER NET ID
    f = file_bin_open('profiles/' + global.Profile + '.save',1)
    file_bin_write_byte(f,global.PNETID)
      
    //PLAYER NAME
    tmp = string_length(global.PNAME)
    file_bin_write_byte(f,tmp)
    for (i=1;i<=tmp;i++)
    file_bin_write_byte(f,string_char_at(global.PNAME,i))
        
    //LOCALE:             
    file_bin_write_byte(f,global.PLOCALE)
    
    file_bin_close(f)
