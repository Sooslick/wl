ServerRefreshTimer = 5000
var state = '0'
var w = '0'
if GR != -1 {
  if GR.prepared
    state = '1'
  w = string(GR.wl.Words)
  }
http_get(global.domain+'wl/updRoom.php?access_token=' + global.userdata[?'AT'] +
                                     '&rid=' + ServerRID +
                                     '&state=' + state +
                                     '&players=' + string(Players) +
                                     '&words=' + w)
