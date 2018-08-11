//check PROFILE_STRUCT README 4 ADDITIONAL INFO
var f       //file
var tmp, s, i, j
var v       //version byte array

if file_exists('profiles/' + global.config[?'ProfileFile'] + '.save')
    {
    f = file_bin_open('profiles/' + global.config[?'ProfileFile'] + '.save',0)
    //SAVE HEADER
    v[0] = file_bin_read_byte(f)
    v[1] = file_bin_read_byte(f)
    v[2] = file_bin_read_byte(f)
    v[3] = file_bin_read_byte(f)
    if v[0] == 0 && v[1] == 0 && v[2] == 0 && v[3] == 4
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
        global.profile[?'PSGAMES'] = funcReadLong(f)
        global.profile[?'PSENDS'] = funcReadLong(f)
        global.profile[?'PSSERVERS'] = funcReadLong(f)
        global.profile[?'PSRESETS'] = funcReadLong(f)
        
        global.profile[?'GM1'] = file_bin_read_byte(f)
        global.profile[?'GM2'] = file_bin_read_byte(f)
        //STAT: sectons
        global.profile[?'PSSECTIONS'] = ds_map_create()
        var SECTIONS = file_bin_read_byte(f)
        for (i=0; i<SECTIONS; i++)
          {
          //General fields
          var SECTMAP = ds_map_create()
          var SECTID = file_bin_read_byte(f);
          SECTMAP[?'PSPLAYTIME'] = funcReadLong(f)
          SECTMAP[?'PSGAMES'] = funcReadLong(f)
          SECTMAP[?'PSWORDS'] = funcReadLong(f)
          SECTMAP[?'PSINPUTS'] = funcReadLong(f)
          SECTMAP[?'PSLETTERS'] = funcReadLong(f)
          SECTMAP[?'PSLETTERSA'] = funcReadLong(f)
          SECTMAP[?'PSLETTERSB'] = funcReadLong(f)
          SECTMAP[?'PSHINTS'] = funcReadLong(f)
          SECTMAP[?'PSSHIFTSA'] = funcReadLong(f)
          SECTMAP[?'PSSHIFTSU'] = funcReadLong(f)
          SECTMAP[?'PSBANNED'] = funcReadLong(f)
          SECTMAP[?'PSUNBANSA'] = funcReadLong(f)
          SECTMAP[?'PSUNBANSU'] = funcReadLong(f)
          SECTMAP[?'PSBANTYPED'] = funcReadLong(f)
          SECTMAP[?'PSSHORTTYPED'] = funcReadLong(f)
          SECTMAP[?'PSWRONGTYPED'] = funcReadLong(f)
          SECTMAP[?'PSREPTYPED'] = funcReadLong(f) 
          SECTMAP[?'PSLENAVERAGE'] = funcReadLong(f)
           
          //Length fields
          SECTMAP[?'PSLENGTHMAP'] = ds_map_create()
          var LENGTHS = file_bin_read_byte(f)
          for (j=0; j<LENGTHS; j++)
            {
            var L = file_bin_read_byte(f)
            var LMAP = ds_map_create()
            //TODO check locale issues
            for (tmp=0; tmp<26; tmp++)
              ds_map_add(LMAP, funcChrDecode(tmp), funcReadLong(f))
            ds_map_add(SECTMAP[?'PSLENGTHMAP'], L, LMAP)
            }
          
          //add SECTION to global pf map
          ds_map_add(global.profile[?'PSSECTIONS'],SECTID,SECTMAP)
          }
        
        //STAT: ACHIEVEMENTS SECTIONS
        //TODO

        file_bin_close(f)
        exit
        }        
    file_bin_close(f)
    }
global.profile[?'PNETID'] = -1
global.profile[?'PNAME'] = 'SAVE CORRUPTED'
global.profile[?'PLOCALE'] = 0
    
global.profile[?'PSINGAMETIME'] = 0
global.profile[?'PSPLAYTIME'] = 0
global.profile[?'PSONLINETIME'] = 0

global.profile[?'PSGAMES'] = 0
global.profile[?'PSENDS'] = 0
global.profile[?'PSSERVERS'] = 0
global.profile[?'PSRESETS'] = 0
    
global.profile[?'GM1'] = 0
global.profile[?'GM2'] = 0

global.profile[?'PSSECTIONS'] = ds_map_create()

global.SaveCorrupted = true
