//arg0: acceptor player ID
//important! Set Shift, TT and other neccesary fields in GR first! for xmpl, after Vote ends.
//Todo: should Word, Shift, TT and etc. pass as script parameters?
var p = argument0
var mw = false
if p == 0       //my word flag
  mw = true
var tt = GR.TT
var sh = GR.Shift
buffer_seek(buffer_send, buffer_seek_start, 0);
buffer_write(buffer_send, buffer_s8, 14)
buffer_write(buffer_send, buffer_s8, p)
buffer_write(buffer_send, buffer_bool, true)
buffer_write(buffer_send, buffer_bool, sh)       //using shift
buffer_write(buffer_send, buffer_bool, tt)       //using unban
buffer_write(buffer_send, buffer_string, GR.currWord)
serverBroadcastSocket()
var sc = gameWordAcceptedMulti(GR, mw);
Plr[p].Score+= sc
playerScaleCalc(Plr[p], 0, PlrList.WScore, Plr[p].Score)
//todo bad code!!! Refactor score updating
if p == 0 {               //personal score
  GR.Abil.Value[0]+= sc   //display score
  GR.Stat.pp+= sc         //Stat score
  }
//reset draft words
for (var i=0; i<Players; i++)
  Plr[i].Word = ''
//reset vote
Vote = false
//init letters refresh event + broadcasts
event_user(3)
//sort players by score
with PlrList event_user(0)
