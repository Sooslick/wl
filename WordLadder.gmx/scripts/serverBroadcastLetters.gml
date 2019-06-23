var l = GR.l
buffer_seek(buffer_send, buffer_seek_start, 0);
buffer_write(buffer_send, buffer_s8, 15)                //header
buffer_write(buffer_send, buffer_s8, GR.Abil.Value[1])  //shift
buffer_write(buffer_send, buffer_s8, GR.Abil.Value[2])  //unban
buffer_write(buffer_send, buffer_s8, GR.MinLen)         //length

var B = ds_list_size(l.TabuList);
var G = ds_list_size(l.TargetList);
var S = '';
for (var i=0; i<B; i++)
  S+= l.TabuList[|i]
for (var i=0; i<G; i++)
  S+= l.TargetList[|i]

buffer_write(buffer_send, buffer_s8, B)             //Banned qty
buffer_write(buffer_send, buffer_s8, G)             //Greens Qty
buffer_write(buffer_send, buffer_string, S)         //Banned + Greens char sequence
serverBroadcastSocket()
