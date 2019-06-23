for (var i=1; i<Players; i++)
  network_send_packet( Plr[i].Sock, buffer_send, buffer_tell(buffer_send) );
