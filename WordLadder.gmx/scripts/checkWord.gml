//argument0: word
//argument1: pointer to GR object
//argument2: TTNum

//same algorhytm as SoloGameRuler enter press event. Used in multiplayer to validate word

var currWord = argument0;
var GR = argument1;
var TT = argument2;

var WL = GR.wl;       //wordlist
var L = GR.l;         //special letters list

//check len
if string_length(currWord) < GR.MinLen
  return false
  
//check tabu
for (var i=2; i<=string_length(currWord); i++) {
  var j = ds_list_find_index(L.TabuList, string_char_at(currWord,i));
  if (j != -1) && (j != TT)
    return false
  }

//check prevword
if wordlistTyped(WL, currWord, false)
  return false                                                    
    
//check dict
//first lv find
var tmpm = ds_map_find_value(global.DictDS,string_char_at(currWord,1));
if tmpm != -1 {
  var tmpl = ds_map_find_value(tmpm,string_char_at(currWord,2));
  if tmpl != -1 {
    var tmp = ds_list_find_index(tmpl,currWord);
    if tmp != -1
      return true
    }
  }
return false
