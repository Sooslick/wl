//progbar increment
TabuPB.Prog++
if TabuPB.Prog >= TabuPB.Req {
  TabuQty++
  TabuPB.Prog = 0
  TabuPB.Req = BanArr[TabuQty]
  }
//progbar anim
TabuPB.Anim = true
TabuPB.AnimXTarget = TabuPB.Prog / TabuPB.Req * 1600
//check parent
if parent == -1
  exit
//ban letters
ds_list_clear(TabuList)
if TabuString == ''
  //from random
  for (i=0; i<TabuQty; i++) {
    var tmp = lettersNextBanPercent(TabuVowel + TabuPB.Prog / 20)      //Vowel% chance of vowel tabu
    if (tmp != string_char_at(parent.prevWord,string_length(parent.prevWord))) && (ds_list_find_index(TabuList,tmp) == -1)
        ds_list_add(TabuList,tmp)
    }
else
  //from string
  for (i=0; i<TabuQty; i++) {
    var tmp = string_char_at(TabuString,1)
    if (tmp != string_char_at(parent.prevWord,string_length(parent.prevWord))) && (ds_list_find_index(TabuList,tmp) == -1)
        ds_list_add(TabuList,tmp)
    if string_length(TabuString) <= 1 {
      TabuString = ''
      break
      }
    else
      TabuString = string_copy(TabuString, 2, string_length(TabuString)-1)
    }
//target letters
ds_list_clear(TargetList)
if TargetString == ''
  //from random
  for (i=0; i<TargetQty; i++) {
    var tmp = lettersNextBanPercent(TabuVowel + TabuPB.Prog / 20)      //Vowel% chance of vowel tabu
    if (ds_list_find_index(TargetList,tmp) == -1) && (ds_list_find_index(TabuList,tmp) == -1)
        ds_list_add(TargetList,tmp)
    }
else
  //from string
  for (i=0; i<TargetQty; i++) {
    var tmp = string_char_at(TargetString,1)
    if (ds_list_find_index(TargetList,tmp) == -1) && (ds_list_find_index(TabuList,tmp) == -1)
        ds_list_add(TargetList,tmp)
    if string_length(TargetString) <= 1 {
      TargetString = ''
      break
      }
    else
      TargetString = string_copy(TargetString, 2, string_length(TargetString)-1)
    }
