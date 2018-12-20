funcProfileFree()
//check PROFILE_STRUCT README 4 ADDITIONAL INFO

//todo: mem free; validate file
//todo: reset profile function and refactor
var f       //file
var tmp, s, i, j
var v       //version byte array
var ok = true;
//todo validate all data!
//todo: check seek position to prevent reading out of file
if file_exists('profiles/' + global.config[?'ProfileFile'] + '.save')
    {
    f = file_bin_open('profiles/' + global.config[?'ProfileFile'] + '.save',0)
    //SAVE HEADER
    v[0] = file_bin_read_byte(f)
    v[1] = file_bin_read_byte(f)
    v[2] = file_bin_read_byte(f)
    v[3] = file_bin_read_byte(f)
    if !(v[0] == 0 && v[1] == 0 && v[2] == 0 && v[3] == 6)
        ok = false
    if ok
        {
        //LAST SAVE TIMESTAMP
        global.profile[?'SAVETS'] = funcReadLong(f)
        //PLAYER NET ID
        global.profile[?'PNETID'] = funcReadLong(f)
        if global.userdata[?'PNETID'] != global.profile[?'PNETID']    //validation
            ok = false
        }
    if ok
        {
        //PLAYER NAME
        global.profile[?'PNAME'] = funcReadString(f) 
        if global.profile[?'PNAME'] == ""
            global.profile[?'PNAME'] = global.userdata[?'LOGIN'] 
        //LOCALE:                       //0 eng; 1 ru
        global.profile[?'PLOCALE'] = file_bin_read_byte(f)
        //NEWS HEADLINE
        global.profile[?'PHEADLINE'] = funcReadString(f,12)
        //STAT: TIMERS
        global.profile[?'PSINGAMETIME'] = funcReadLong(f)
        global.profile[?'PSPLAYTIME'] = funcReadLong(f)
        global.profile[?'PSONLINETIME'] = funcReadLong(f)
        //STAT: game's overall
        global.profile[?'PSGAMES'] = funcReadLong(f)
        global.profile[?'PSENDS'] = funcReadLong(f)
        global.profile[?'PSSERVERS'] = funcReadLong(f)
        global.profile[?'PSRESETS'] = funcReadLong(f)
        //STAT: global counters
        global.profile[?'GM1'] = file_bin_read_byte(f)
        global.profile[?'GM2'] = file_bin_read_byte(f)
        global.profile[?'PSLV'] = funcReadLong(f)
        global.profile[?'PSXP'] = funcReadLong(f)
        //STAT: sectons
        var SECTIONS_MAP = ds_map_create();
        var TOTAL_SECTIONS = file_bin_read_byte(f);
        for (i=0; i<TOTAL_SECTIONS; i++)
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
          SECTMAP[?'PSBESTSCORE'] = funcReadLong(f) 
          SECTMAP[?'PSLASTSCORE'] = funcReadLong(f)          
          //Length fields
          var LENGTH_MAP = ds_map_create();
          var LENGTHS = file_bin_read_byte(f)
          for (j=0; j<LENGTHS; j++)
            {
            var L = file_bin_read_byte(f)
            var LMAP = ds_map_create()
            //TODO check locale issues
            for (tmp=0; tmp<26; tmp++)
              ds_map_add(LMAP, funcChrDecode(tmp), funcReadLong(f))
            ds_map_add_map(LENGTH_MAP, L, LMAP)
            }  
          ds_map_add_map(SECTMAP, 'PSLENGTHMAP', LENGTH_MAP)  
          //add SECTION to global pf map
          ds_map_add_map(SECTIONS_MAP,SECTID,SECTMAP)
          }
        ds_map_add_map(global.profile, 'PSSECTIONS', SECTIONS_MAP)
        
        //STAT: ACHIEVEMENTS SECTIONS
        var a = ds_list_create();
        var p = ds_list_create();
        for (var i=0; i<36; i++) {
          a[|i] = file_bin_read_byte(f)
          p[|i] = funcReadLong(f)
          }
        ds_map_add_list(global.profile, 'ACHVS', a)
        ds_map_add_list(global.profile, 'ACHVPROG', p)

        file_bin_close(f)
        exit
        }        
    file_bin_close(f)
    }
//save not readed
global.profile[?'PNETID'] = global.userdata[?'PNETID']
global.profile[?'PNAME'] = global.config[?'ProfileFile']
global.profile[?'SAVETS'] = 0
global.profile[?'PLOCALE'] = 0
global.profile[?'PHEADLINE'] = 0
global.profile[?'PSINGAMETIME'] = 0
global.profile[?'PSPLAYTIME'] = 0
global.profile[?'PSONLINETIME'] = 0
global.profile[?'PSGAMES'] = 0
global.profile[?'PSENDS'] = 0
global.profile[?'PSSERVERS'] = 0
global.profile[?'PSRESETS'] = 0
global.profile[?'GM1'] = 0
global.profile[?'GM2'] = 0
global.profile[?'PSLV'] = 0
global.profile[?'PSXP'] = 0
//sections
var m = ds_map_create();
ds_map_add_map(global.profile, 'PSSECTIONS', m) //empty section map
//empty achievements
var a = ds_list_create()
var p = ds_list_create()
for (var i=0; i<36; i++) {
  a[|i] = 0
  p[|i] = 0
  }
ds_map_add_list(global.profile, 'ACHVS', a)
ds_map_add_list(global.profile, 'ACHVPROG', p)

global.SaveCorrupted = true
