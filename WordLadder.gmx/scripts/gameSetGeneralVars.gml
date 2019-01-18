//general
prestart = false
prepared = false
paused = false
bBack = -1
bEnd = -1
prevWord = ''
currWord = ''
//extra game vars
MaxLen = 9                //used in word list  for stretching //deprecated?
DecQty = 0                //prog: tabuqty + wordlen  - 10
AllowDec = true
Shift = false             //prog: greens + wordlen
TT = false                //using of ability flags
TTNum = -1                //prog: tabuqty + greens + wordlen
//hints vars
Think = 0                   //one word clockwatch
HintTimeUp = false
HintTooLong = false
HintTimer = 0               //while >0 a new oSquareHint cannot be created
HintObj = -1
