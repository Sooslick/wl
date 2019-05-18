//rm tempfile
if file_exists('profiles/temp.dat')
  file_delete('profiles/temp.dat')
//sections
var sects = global.profile[?'PSSECTIONS'];            //GLOBAL SECTIONS MAP <ID, SECTMAP>
if !is_undefined(sects) {
  //section maps
  var sectid = ds_map_find_first(sects);                //SECTID -> SECTMAPs
  while !is_undefined(sectid) {
    var curr_sect = sects[?sectid];                     //SECTION <KEY, VALUE>
    var lmap = curr_sect[?'PSLENGTHMAP'];               //LENGTHS MAP <LENGTH, WORDMAP>
    var l = ds_map_find_first(lmap);
    while !is_undefined(l) {
      var wordmap = lmap[?l];
      if !is_undefined(wordmap)
        ds_map_destroy(wordmap)
      l = ds_map_find_next(lmap, l)
      }
    ds_map_destroy(lmap)
    ds_map_destroy(curr_sect)
    sectid = ds_map_find_next(sects, sectid)
    }
  ds_map_destroy(sects)
  }
  
//free achievements & saved endless wordlist
if !is_undefined(global.profile[?'ACHVS'])
  ds_list_destroy(global.profile[?'ACHVS'])
if !is_undefined(global.profile[?'ACHVPROG'])
  ds_list_destroy(global.profile[?'ACHVPROG'])
if !is_undefined(global.profile[?'ENDWORDLIST'])
  ds_list_destroy(global.profile[?'ENDWORDLIST'])
