//anonymous
if global.userdata[?'PNETID'] == 0
  exit
//check PROFILE_STRUCT README 4 ADDITIONAL INFO

    //PLAYER NET ID
    f = file_bin_open('profiles/' + global.config[?'ProfileFile'] + '.save',1)
    file_bin_write_byte(f,0)
    file_bin_write_byte(f,0)
    file_bin_write_byte(f,0)
    file_bin_write_byte(f,7)        //4 bytes: version
    funcWriteLong(f,current_time)
    funcWriteLong(f,global.profile[?'PNETID'])
      
    //PLAYER NAME
    tmp = string_length(global.profile[?'PNAME'])
    file_bin_write_byte(f,tmp)
    for (i=1;i<=tmp;i++)
    file_bin_write_byte(f,ord(string_char_at(global.profile[?'PNAME'],i)))
        
    //LOCALE:             
    file_bin_write_byte(f,global.profile[?'PLOCALE'])
    
    //LAST NEWS HEADLINE
    for (i=1;i<=12;i++)
        file_bin_write_byte(f,ord(string_char_at(global.profile[?'PHEADLINE'],i)))
    
    //STATS:                    //writing numbers from starshiy to mladshiy razryads
    funcWriteLong(f,global.profile[?'PSINGAMETIME'])
    funcWriteLong(f,global.profile[?'PSPLAYTIME'])
    funcWriteLong(f,global.profile[?'PSONLINETIME'])
    funcWriteLong(f,global.profile[?'PSGAMES'])
    funcWriteLong(f,global.profile[?'PSENDS'])
    funcWriteLong(f,global.profile[?'PSSERVERS'])
    funcWriteLong(f,global.profile[?'PSRESETS'])
    file_bin_write_byte(f,global.profile[?'GM1'])
    file_bin_write_byte(f,global.profile[?'GM2'])
    funcWriteLong(f,global.profile[?'PSLV'])
    funcWriteLong(f,global.profile[?'PSXP'])
    
    //SECTIONS COUNT:
    file_bin_write_byte(f,ds_map_size(global.profile[?'PSSECTIONS']))
    
    //SECTION WRITE:
    if ds_map_size(global.profile[?'PSSECTIONS']) > 0
      {
      var SECTMAP = global.profile[?'PSSECTIONS'];
      var SECTID = ds_map_find_first(SECTMAP);
      var CURRMAP;
      while (!is_undefined(SECTID))
        {
        file_bin_write_byte(f,SECTID)
        CURRMAP = SECTMAP[?SECTID]
        funcWriteLong(f,CURRMAP[?'PSPLAYTIME'])
        funcWriteLong(f,CURRMAP[?'PSGAMES'])
        funcWriteLong(f,CURRMAP[?'PSWORDS'])
        funcWriteLong(f,CURRMAP[?'PSINPUTS'])
        funcWriteLong(f,CURRMAP[?'PSLETTERS'])
        funcWriteLong(f,CURRMAP[?'PSLETTERSA'])
        funcWriteLong(f,CURRMAP[?'PSLETTERSB'])
        funcWriteLong(f,CURRMAP[?'PSHINTS'])
        funcWriteLong(f,CURRMAP[?'PSSHIFTSA'])
        funcWriteLong(f,CURRMAP[?'PSSHIFTSU'])
        funcWriteLong(f,CURRMAP[?'PSBANNED'])
        funcWriteLong(f,CURRMAP[?'PSUNBANSA'])
        funcWriteLong(f,CURRMAP[?'PSUNBANSU'])
        funcWriteLong(f,CURRMAP[?'PSBANTYPED'])
        funcWriteLong(f,CURRMAP[?'PSSHORTTYPED'])
        funcWriteLong(f,CURRMAP[?'PSWRONGTYPED'])
        funcWriteLong(f,CURRMAP[?'PSREPTYPED'])
        funcWriteLong(f,CURRMAP[?'PSGREENS']) 
        funcWriteLong(f,CURRMAP[?'PSGREENSTYPED']) 
        funcWriteLong(f,CURRMAP[?'PSDECREMENTS']) 
        funcWriteLong(f,CURRMAP[?'PSLASTSCORE'])
        //LENS COUNT
        file_bin_write_byte(f,ds_map_size(CURRMAP[?'PSLENGTHMAP']))
        //SECTION WORD LENGTHS
        var LENMAP = CURRMAP[?'PSLENGTHMAP'];
        var LENID = ds_map_find_first(LENMAP);
        var CURRLEN;
        for (j=0; j<ds_map_size(LENMAP); j++)
          {
          file_bin_write_byte(f,LENID)
          CURRLEN = LENMAP[?LENID]
          for (tmp=0; tmp<26; tmp++)
            {
            if is_undefined(CURRLEN[?funcChrDecode(tmp)])
              funcWriteLong(f,0)
            else
              funcWriteLong(f,CURRLEN[?funcChrDecode(tmp)])
            }
          LENID = ds_map_find_next(LENMAP,LENID)
          }
        SECTID = ds_map_find_next(SECTMAP,SECTID)
        }
      }
    
      //achvs
    var a = global.profile[?'ACHVS'];
    var p = global.profile[?'ACHVPROG'];
    for (var i=0; i<36; i++) {
      file_bin_write_byte(f, a[|i])
      funcWriteLong(f, p[|i])
      }
      
    file_bin_close(f)
