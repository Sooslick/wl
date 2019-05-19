with Stat statWrite(false)
instance_destroy(Stat, true)
if global.GameType > 5
  instance_destroy(Net, true)      //no nullpointer validation for singleplayer, just gametype enum check
instance_destroy(self, true)
//todo: gameruler and another objs?
room_goto(rMenu)
