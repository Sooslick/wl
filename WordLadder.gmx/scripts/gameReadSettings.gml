//settings. Col 1: word length, start timer and sec per letters
MinLen = global.custom[?'StartLen']
SecPerLetter = global.custom[?'Sec'] * 1000
switch global.custom[?'StartTimer'] {
  case 0: CfgTimer = 30000; break;    //30s
  case 1: CfgTimer = 45000; break;
  case 2: CfgTimer = 60000; break;
  case 3: CfgTimer = 7500*MinLen; break;
  default:
    if global.custom[?'StartTimer'] < 20
      CfgTimer = 60000
    else
      CfgTimer = global.custom[?'StartTimer'] * 1000
  }
//Settings: Col 3: banned &amp; Target
switch global.custom[?'Banned'] {
  case 0:
    CfgBanArr[0] = 3
    CfgBanArr[1] = 10
    CfgBanArr[2] = 42
    CfgBanArr[3] = 42
    CfgBanArr[4] = 66
    CfgBanArr[5] = 100
    CfgBanArr[6] = 228
    CfgBanArr[7] = 9000
    break
  case 1:
    CfgBanArr[0] = 3
    CfgBanArr[1] = 10
    CfgBanArr[2] = 24
    CfgBanArr[3] = 42
    CfgBanArr[4] = 42
    CfgBanArr[5] = 66
    CfgBanArr[6] = 100
    CfgBanArr[7] = 100
    break
  case 2:
    CfgBanArr[0] = 3
    CfgBanArr[1] = 10
    CfgBanArr[2] = 22
    CfgBanArr[3] = 35
    CfgBanArr[4] = 42
    CfgBanArr[5] = 66
    CfgBanArr[6] = 84
    CfgBanArr[7] = 98
    break
  }
CfgTabuVowel = global.custom[?'Vowels']
switch global.custom[?'Green'] {
  case 0: CfgTargetQty = 2; break;
  case 1: CfgTargetQty = 1; break;
  case 2: CfgTargetQty = 0
  }
//settings: col 2. Specials
switch global.custom[?'Dec'] {    //decrements. Todo: object
  case 0:
    DecArr[0] = 3
    DecArr[1] = 10
    DecArr[2] = 24
    DecArr[3] = 42
    DecArr[4] = 66
    DecArr[5] = 98
    DecArr[6] = 100
    break
  case 1:
    DecArr[0] = 10
    DecArr[1] = 42
    DecArr[2] = 42
    DecArr[3] = 66
    DecArr[4] = 66
    DecArr[5] = 98
    DecArr[6] = 228
    break
  case 2:
    DecArr[0] = 9000
    DecArr[1] = 9999
    DecArr[2] = 99999
    DecArr[3] = 999999
    DecArr[4] = 9999999
    DecArr[5] = 99999999
    DecArr[6] = 999999999
    break
  case 3:
    DecArr[0] = 10
    DecArr[1] = 13
    DecArr[2] = 17
    DecArr[3] = 25
    DecArr[4] = 33
    DecArr[5] = 42
    DecArr[6] = 66
    break
  }
//shift
if global.custom[?'Shift']
  CfgShift = 100                       //linear increase
else
  CfgShift = 999999999
  //unban
if global.custom[?'Unban']
  CfgUnban = 200                            //linear increase
else
  CfgUnban = 999999999
//hints
EnableHints = global.custom[?'Hints']
