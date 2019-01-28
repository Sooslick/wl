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
      PtpArrTimer[i] = GR.Timer
      PtpArrPlaying[i] = true
      var r = irandom_range(0, Players-1);
      if r != i
        {
        var p = PtpArrPos[i];
        PtpArrPos[i] = PtpArrPos[r];
        PtpArrPos[r] = p;
        }
      }
    PtpPos = 0
    PtpPosMax = Players - 1
    for (var i=1; i<Players; i++)
      {
      //ptp fields
      buffer_seek(buffer_send, buffer_seek_start, 0);
      buffer_write(buffer_send, buffer_s8, 26)
      buffer_write(buffer_send, buffer_s32, PtpArrTimer[i])
      if PtpPos == PtpArrPos[i]
        buffer_write(buffer_send, buffer_bool, true)
      else
        buffer_write(buffer_send, buffer_bool, false)
      buffer_write(buffer_send, buffer_s8, PtpArrShift[i])
      buffer_write(buffer_send, buffer_s8, PtpArrUnban[i])
      network_send_packet( PlsArrSock[i], buffer_send, buffer_tell(buffer_send) );
      }
    if PtpArrPos[0] == PtpPos
      {
      GR.myWord = true
      GR.waiting = false
      GR.Cube.ApplyBw = false
      }
    }
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
