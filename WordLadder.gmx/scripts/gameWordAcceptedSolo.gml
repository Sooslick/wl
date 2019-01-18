//count fields
var ws = Stat.words;                    //words total
var ls = string_length(currWord);       //letters in current word
var ms = Timer.Timer div 60000;         //minutes on timer
var bs = ds_list_size(l.TabuList);      //banned
var ts = 0;                             //target letters
for (i=0; i< ds_list_size(l.TargetList); i++)       //count ts
  ts+= string_count(l.TargetList[| i],prevWord)
//stats count
Stat.words++
Stat.lettersa+= ls
Stat.pp+= ws + ms + ls + ts
Stat.targetsa+= ts
Stat.targets+= ds_list_size(l.TargetList)
Stat.banned+= bs
//fix score display
Abil.Value[0] = Stat.pp
//Stat write new word
Stat.LenWord = currWord
with Stat {event_user(2)}
//write word and proceed
wordlistAddWord(wl,currWord)
prevWord = currWord
MinLen = string_length(currWord)
if MinLen > MaxLen                //MaxLength to adjust scale in wlist
  MaxLen = MinLen
if MinLen > 15                    //Const Max Length: 15. todo?
  MinLen = 15
currWord = string_char_at(currWord, string_length(currWord))
//Timer bonus
Timer.Timer+= (ls-1)*SecPerLetter - Timer div 60        //every minute on timer
//shift usage                                            //causes loss f one second
if Shift {
  abilChange(Abil, 1, -1)
  Stat.shiftsu++
  Shift = false
  }
//ban usage
if TT {
  TT = false
  TTNum = -1
  abilChange(Abil, 2, -1)
  Stat.unbansu++
  }
//Shift progress
ShiftPB.Prog+= ls + ts
if ShiftPB.Prog >= ShiftPB.Req {
  ShiftPB.Prog-= ShiftPB.Req
  ShiftPB.Req+= MinLen
  abilChange(Abil, 1, 1)
  Stat.shiftsa++
  }
ShiftPB.Anim = true                                     //todo refactor: pb anim functon
ShiftPB.AnimXTarget = ShiftPB.Prog / ShiftPB.Req * 1600
//TT prog
TTPB.Prog+= ls + ts + bs
if TTPB.Prog >= TTPB.Req {
  TTPB.Prog-= TTPB.Req
  TTPB.Req+= TTPB.Req div 42
  abilChange(Abil, 2, 1)
  Stat.unbansa++
  }
TTPB.Anim = true
TTPB.AnimXTarget = TTPB.Prog / TTPB.Req * 1600
//length dec calc
if AllowDec {
  var decr = ls + bs - 9
  if decr > 0 {
    DecPB.Prog+= decr
    if DecPB.Prog >= DecPB.Req {
      DecPB.Prog-= DecPB.Req
      DecQty++
      MinLen--
      Stat.decrements++
      DecPB.Req = DecArr[DecQty]
      }
    DecPB.Anim = true
    DecPB.AnimXTarget = DecPB.Prog / DecPB.Req * 1600
    }
  }
//letters refresh
with l {lettersNext()}
//HintRefresh
HintTimeUp = false
HintTooLong = false
Think = 0
HintTimer+= 420
//Cube Operations: Rotate & Refresh word 
Cube.Rot = true
Cube.LengthErrTick = 0
Cube.LengthErr = false
Cube.NewLen = MinLen
Cube.TabuErr = false
Cube.TabuErrNum = -1
