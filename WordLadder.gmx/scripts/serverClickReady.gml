//arg0: player ID
var pid = argument0;

Ready++
ptpPlayers++
Plr[pid].Ready = true
//send start signal
if Players == Ready {
  with GR event_user(4)   //todo: refactor GR events to functions
  //send ready + firstword state
  buffer_seek(buffer_send, buffer_seek_start, 0);
  buffer_write(buffer_send, buffer_s8, 10)
  buffer_write(buffer_send, buffer_s8, Ready)
  buffer_write(buffer_send, buffer_string, GR.Cube.w1)
  for (var i=1; i<Players; i++)
    network_send_packet( Plr[i].Sock, buffer_send, buffer_tell(buffer_send) );
  //send timer state
  buffer_seek(buffer_send, buffer_seek_start, 0);
  buffer_write(buffer_send, buffer_s8, 12)
  buffer_write(buffer_send, buffer_s32, GR.Timer.Timer)
  for (var i=1; i<Players; i++)
      network_send_packet( Plr[i].Sock, buffer_send, buffer_tell(buffer_send) );
  //todo check  
  if ptp { 
    for (var i=0; i<Players; i++)
      {
      Plr[i].Timer = GR.Timer.Timer
      Plr[i].Playing = true
      //shuffle player's pos
      var r = irandom_range(0, Players-1);
      if r != i {
        var p = Plr[i].Pos;
        Plr[i].Pos = Plr[r].Pos
        Plr[r].Pos = p;
        }
      }
    PtpPos = 0
    PtpPosMax = Players - 1
    for (var i=1; i<Players; i++) {
      //ptp fields
      buffer_seek(buffer_send, buffer_seek_start, 0);
      buffer_write(buffer_send, buffer_s8, 26)
      buffer_write(buffer_send, buffer_s32, Plr[i].Timer)
      if PtpPos == Plr[i].Pos
        buffer_write(buffer_send, buffer_bool, true)
      else
        buffer_write(buffer_send, buffer_bool, false)
      buffer_write(buffer_send, buffer_s8, Plr[i].Shift)
      buffer_write(buffer_send, buffer_s8, Plr[i].Unban)
      network_send_packet( Plr[i].Sock, buffer_send, buffer_tell(buffer_send) );
      }
    if Plr[0].Pos == PtpPos {
      GR.myWord = true
      GR.waiting = false
      GR.Cube.ApplyBw = false
      }
    }
    //finally: send room upd request
    serverUpdRoom()
  }
//send ready count otherwise
else {
  GR.prestart = true
  buffer_seek(buffer_send, buffer_seek_start, 0);
  buffer_write(buffer_send, buffer_s8, 10)
  buffer_write(buffer_send, buffer_s8, Ready)
  buffer_write(buffer_send, buffer_string, GR.currWord)
  for (var i=1; i<Players; i++)
      network_send_packet( Plr[i].Sock, buffer_send, buffer_tell(buffer_send) );
  }
