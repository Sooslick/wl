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
    if !(v[0] == 0 && v[1] == 0 && v[2] == 1 && v[3] == 11) //todo: rm hardcode
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
          SECTMAP[?'PSGREENS'] = funcReadLong(f) 
          SECTMAP[?'PSGREENSTYPED'] = funcReadLong(f) 
          SECTMAP[?'PSDECREMENTS'] = funcReadLong(f) 
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

        //STAT: SAVED ENDLESS SECTION
        global.profile[?'ENDSAVED'] = file_bin_read_byte(f)     //is saved flag
        global.profile[?'ENDMINLEN'] = file_bin_read_byte(f)    //current minlen
        global.profile[?'ENDSCORE'] = funcReadLong(f)
        global.profile[?'ENDL'] = funcReadLong(f)               //letters typed
        global.profile[?'ENDLA'] = funcReadLong(f)              //letters accepted
        global.profile[?'ENDLB'] = funcReadLong(f)              //letters backspaced
        global.profile[?'ENDAT'] = funcReadLong(f)              //input attempts
        global.profile[?'ENDTIME'] = funcReadLong(f)            //playtime
        global.profile[?'ENDSHA'] = file_bin_read_byte(f)       //shifts acq
        global.profile[?'ENDSHU'] = file_bin_read_byte(f)       //shifts used
        global.profile[?'ENDTTA'] = file_bin_read_byte(f)       //unbanc acq
        global.profile[?'ENDTTU'] = file_bin_read_byte(f)       //unbans used
        global.profile[?'ENDBANNED'] = funcReadLong(f)          //total banned ltters
        global.profile[?'ENDFAILBAN'] = funcReadLong(f)         //at failed by ban
        global.profile[?'ENDFAILTYP'] = funcReadLong(f)         //        by typo
        global.profile[?'ENDFAILREP'] = funcReadLong(f)         //        by repeat
        global.profile[?'ENDFAILLEN'] = funcReadLong(f)         //        by short length
        global.profile[?'ENDBANQTY'] = file_bin_read_byte(f)    //ban progbar state
        global.profile[?'ENDBANPROG'] = funcReadLong(f)
        global.profile[?'ENDBANREQ'] = funcReadLong(f)
        global.profile[?'ENDSHIFTPROG'] = funcReadLong(f)       //shift pb state
        global.profile[?'ENDSHIFTREQ'] = funcReadLong(f)
        global.profile[?'ENDTTPROG'] = funcReadLong(f)          //unban pb state
        global.profile[?'ENDTTREQ'] = funcReadLong(f)
        global.profile[?'ENDDEC'] = file_bin_read_byte(f)       //dec pb state
        global.profile[?'ENDDECPROG'] = funcReadLong(f)
        global.profile[?'ENDDECREQ'] = funcReadLong(f)
        global.profile[?'ENDBB'] = file_bin_read_byte(f)        //banned letters at the moment
        global.profile[?'ENDBBSTR'] = funcReadString(f, global.profile[?'ENDBB'])
        global.profile[?'ENDWORDS'] = funcReadLong(f)
        
        //SAVED ENDLESS WORDS
        var wl = ds_list_create()
        for (var i=0; i<global.profile[?'ENDWORDS']; i++)
          wl[|i] = funcReadString(f)
        ds_map_add_list(global.profile, 'ENDWORDLIST', wl)
        
        file_bin_close(f)
        funcLogString('SaveRead')
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
//empty save
global.profile[?'ENDSAVED'] = 0
global.profile[?'ENDMINLEN'] = 0
global.profile[?'ENDSCORE'] = 0
global.profile[?'ENDL'] = 0
global.profile[?'ENDLA'] = 0
global.profile[?'ENDLB'] = 0
global.profile[?'ENDAT'] = 0
global.profile[?'ENDTIME'] = 0
global.profile[?'ENDSHA'] = 0
global.profile[?'ENDSHU'] = 0
global.profile[?'ENDTTA'] = 0
global.profile[?'ENDTTU'] = 0
global.profile[?'ENDBANNED'] = 0
global.profile[?'ENDFAILBAN'] = 0
global.profile[?'ENDFAILTYP'] = 0
global.profile[?'ENDFAILREP'] = 0
global.profile[?'ENDFAILLEN'] = 0
global.profile[?'ENDBANQTY'] = 0
global.profile[?'ENDBANPROG'] = 0
global.profile[?'ENDBANREQ'] = 0
global.profile[?'ENDSHIFTPROG'] = 0
global.profile[?'ENDSHIFTREQ'] = 0
global.profile[?'ENDTTPROG'] = 0
global.profile[?'ENDTTREQ'] = 0
global.profile[?'ENDDEC'] = 0
global.profile[?'ENDDECPROG'] = 0
global.profile[?'ENDDECREQ'] = 0
global.profile[?'ENDBB'] = 0
global.profile[?'ENDBBSTR'] = ''
global.profile[?'ENDWORDS'] = 0
ds_map_add_list(global.profile, 'ENDWORDLIST', ds_list_create())

global.SaveCorrupted = true
funcLogString('SaveCorrupted!')
