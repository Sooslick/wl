//arg0: Game Ruler object
//arg1: myWord flag. If false, stats will be not increased
//return value: score by this word. Called from Net object and used for server-side updating player's score

//should it refactor w/ word accept solo?

//count fields
var gr = argument0;
gr.myWord = argument1;
var pp = 0
var ts = 0
for (var i=0; i< ds_list_size(gr.l.TargetList); i++)       //count ts
  ts+= string_count(gr.l.TargetList[| i],gr.currWord)
//client's score counts at server. This value will be returned to server obj
pp = gr.wl.Words + (gr.Timer.Timer div 60000) + string_length(gr.currWord) + ts 
//hell on earth
 
with gr {
  var ws = wl.Words;                      //words total. Get it from list bcs stats counts differenlty.
  var ls = string_length(currWord);       //letters in current word
  var ms = Timer.Timer div 60000;         //minutes on timer
  var bs = ds_list_size(l.TabuList);      //banned
  var ts = 0;                             //target letters
  for (var i=0; i< ds_list_size(l.TargetList); i++)       //count ts
    ts+= string_count(l.TargetList[| i],currWord)
  //stats count
  if myWord {
    Stat.words++
    Stat.lettersa+= ls
    Stat.targetsa+= ts
    Stat.targets+= ds_list_size(l.TargetList)
    Stat.banned+= bs
    //Stat write new word
    Stat.LenWord = currWord
    with Stat {event_user(2)}
  }
  //write word and proceed
  wordlistAddWord(wl,currWord)
  prevWord = currWord
  MinLen = string_length(currWord)
  if MinLen > MaxLen                //MaxLength to adjust scale in wlist
    MaxLen = MinLen
  if MinLen > 15                    //Const Max Length: 15. todo?
    MinLen = 15
  currWord = string_char_at(currWord, string_length(currWord))
  waiting = false
  //Timer bonus
  Timer.Timer+= (ls-1)*SecPerLetter - Timer div 60        //every minute on timer
  //shift usage                                            //causes loss of one second
  if Shift {
    Shift = false
    abilChange(Abil, 1, -1)
    if myWord
      Stat.shiftsu++
    }
  //ban usage
  if TT {
    TT = false
    TTNum = -1
    abilChange(Abil, 2, -1)
    if myWord
      Stat.unbansu++
    }
  //Shift progress
  ShiftPB.Prog+= ls + ts
  if ShiftPB.Prog >= ShiftPB.Req {
    ShiftPB.Prog-= ShiftPB.Req
    ShiftPB.Req+= MinLen
    abilChange(Abil, 1, 1)
    if myWord
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
    if myWord
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
        DecPB.Req = DecArr[DecQty]
        if myWord
          Stat.decrements++
        }
      DecPB.Anim = true
      DecPB.AnimXTarget = DecPB.Prog / DecPB.Req * 1600
      }
    }
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
  //destroy vote
  Vote = false
  if bVoteY != -1 {
    instance_destroy (bVoteY)
    bVoteY = -1
    }
  if bVoteN != -1 {
    instance_destroy (bVoteN)
    bVoteN = -1
    }
  }
return pp;
