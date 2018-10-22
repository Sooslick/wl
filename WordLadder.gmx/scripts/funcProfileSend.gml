//check PROFILE_STRUCT README 4 ADDITIONAL INFO
var bytes = '';
    //PLAYER NET ID
    f = file_bin_open('profiles/' + global.config[?'ProfileFile'] + '.save',0)
    while file_bin_position(f) < file_bin_size(f)
      bytes+= chr(file_bin_read_byte(f))
    file_bin_close(f)
    
http_get('http://sooslick.flaminggaming.ru/wl/saveFile.php?access_token=' + global.at + '&bytes="' + bytes +'"')
