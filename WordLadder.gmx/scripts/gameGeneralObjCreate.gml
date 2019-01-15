//startgame button
BStart = instance_create(800,1000, oButton)
BStart.content = 'BEGIN'
BStart.parent = id
//game objects. 1: word list
wl = instance_create(0,0,oWordList)
wl.parent = id
//letters obj
l = instance_create(0,0,oGameLetters)
l.parent = id
l.BanArr = CfgBanArr
l.TabuPB.Req = l.BanArr[0] 
l.TabuVowel = CfgTabuVowel
l.TargetQty = CfgTargetQty
//Abil obj
Abil = instance_create(0,0,oGameAbil)
Abil.parent = id
//timer obj
Timer = instance_create(0,0,oGameTimer)
Timer.parent = id
Timer.Timer = CfgTimer
//decrementor
DecPB = instance_create(0,30,oProgBar)
DecPB.Req = DecArr[0]
//shift
ShiftPB = instance_create(0,50,oProgBar)
ShiftPB.Req = CfgShift
//unban
TTPB = instance_create(0,70,oProgBar)
TTPB.Req = CfgUnban
//create cubeobj
Cube = instance_create(800,600+MinLen*32,oGameCube)
Cube.parent = id
Cube.w2 = '    '
Cube.w3 = '    '
Cube.w4 = '    '
Cube.Letters = l
//create stat obj
Stat = instance_create(0,0,oGameStatCounter)
Stat.parent = id
Stat.Cube = Cube
Stat.GameTypeID = argument0  //CUSTOM
