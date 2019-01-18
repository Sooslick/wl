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
if parent != -1
  lettersUpdate()
