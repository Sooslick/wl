//todo: fix fields that cannot be rewritten if !finished
var finished = argument0

//global stat fields
if finished
  global.profile[?'PSENDS']++
global.profile[?'PSXP']+= pp
//Profile Stat Write
//Current gamemode last game
SECTMAP = global.profile[?'PSSECTIONS']
CURRMAP = SECTMAP[?GameTypeID+1]
if is_undefined(CURRMAP) {
  CURRMAP = ds_map_create()               //create if gamemode datamap !exists
  ds_map_clear(CURRMAP)
  SECTMAP[?GameTypeID+1] = CURRMAP
  }
CURRMAP[?'PSPLAYTIME'] = ticks
CURRMAP[?'PSGAMES'] = 1                 //only last game. Cannot be 0 or another number
CURRMAP[?'PSWORDS'] = words
CURRMAP[?'PSINPUTS'] = attempts
CURRMAP[?'PSLETTERS'] = letters
CURRMAP[?'PSLETTERSA'] = lettersa
CURRMAP[?'PSLETTERSB'] = lettersb
CURRMAP[?'PSHINTS'] = hints
CURRMAP[?'PSSHIFTSA'] = shiftsa
CURRMAP[?'PSSHIFTSU'] = shiftsu
CURRMAP[?'PSBANNED'] = banned
CURRMAP[?'PSUNBANSA'] = unbansa
CURRMAP[?'PSUNBANSU'] = unbansu
CURRMAP[?'PSBANTYPED'] = tabus
CURRMAP[?'PSSHORTTYPED'] = lens
CURRMAP[?'PSWRONGTYPED'] = dicts
CURRMAP[?'PSREPTYPED'] = prevs
CURRMAP[?'PSGREENS'] = targets
CURRMAP[?'PSGREENSTYPED'] = targetsa
CURRMAP[?'PSDECREMENTS'] = decrements
CURRMAP[?'PSLASTSCORE'] = pp
CURRMAP[?'PSLENGTHMAP'] = ds_map_create()
ds_map_copy(CURRMAP[?'PSLENGTHMAP'], LenMap)

//OVERALL GAMEMODE
OVERMAP = SECTMAP[?GameTypeID]
if is_undefined(OVERMAP) {
  OVERMAP = ds_map_create()
  ds_map_copy(OVERMAP,SECTMAP[?GameTypeID+1])
  SECTMAP[?GameTypeID] = OVERMAP
  }
else {
  OVERMAP[?'PSPLAYTIME']+= CURRMAP[?'PSPLAYTIME']
  OVERMAP[?'PSGAMES']+= CURRMAP[?'PSGAMES']
  OVERMAP[?'PSWORDS']+= CURRMAP[?'PSWORDS']
  OVERMAP[?'PSINPUTS']+= CURRMAP[?'PSINPUTS']
  OVERMAP[?'PSLETTERS']+= CURRMAP[?'PSLETTERS']
  OVERMAP[?'PSLETTERSA']+= CURRMAP[?'PSLETTERSA']
  OVERMAP[?'PSLETTERSB']+= CURRMAP[?'PSLETTERSB']
  OVERMAP[?'PSHINTS']+= CURRMAP[?'PSHINTS']
  OVERMAP[?'PSSHIFTSA']+= CURRMAP[?'PSSHIFTSA']
  OVERMAP[?'PSSHIFTSU']+= CURRMAP[?'PSSHIFTSU']
  OVERMAP[?'PSBANNED']+= CURRMAP[?'PSBANNED']
  OVERMAP[?'PSUNBANSA']+= CURRMAP[?'PSUNBANSA']
  OVERMAP[?'PSUNBANSU']+= CURRMAP[?'PSUNBANSU']
  OVERMAP[?'PSBANTYPED']+= CURRMAP[?'PSBANTYPED']
  OVERMAP[?'PSSHORTTYPED']+= CURRMAP[?'PSSHORTTYPED']
  OVERMAP[?'PSWRONGTYPED']+= CURRMAP[?'PSWRONGTYPED']
  OVERMAP[?'PSREPTYPED']+= CURRMAP[?'PSREPTYPED']
  OVERMAP[?'PSLASTSCORE']+= CURRMAP[?'PSLASTSCORE']
  //TODO DEBUG LETTERS
  OVERMAP = OVERMAP[?'PSLENGTHMAP']
  var src = ds_map_find_first(LenMap);      //src = key
  var dest;                                 //dest = map
  while (!is_undefined(src))
    {
    dest = OVERMAP[?src]
    if is_undefined(dest)
      {
      dest = ds_map_create()
      ds_map_copy(dest,LenMap[?src])
      ds_map_add(OVERMAP,src,dest)
      }
    else
      {
      tmp = LenMap[?src]
      for(i=0; i<26; i++)
        dest[?funcChrDecode(i)]+= tmp[?funcChrDecode(i)]
      }
    src = ds_map_find_next(LenMap,src)
    }
  }
  
//OVERALL GAME
OVERMAP = SECTMAP[?0]
if is_undefined(OVERMAP) {
  OVERMAP = ds_map_create()
  ds_map_copy(OVERMAP,SECTMAP[?GameTypeID+1])
  SECTMAP[?0] = OVERMAP
  }
else {
  OVERMAP[?'PSPLAYTIME']+= CURRMAP[?'PSPLAYTIME']
  OVERMAP[?'PSGAMES']+= CURRMAP[?'PSGAMES']
  OVERMAP[?'PSWORDS']+= CURRMAP[?'PSWORDS']
  OVERMAP[?'PSINPUTS']+= CURRMAP[?'PSINPUTS']
  OVERMAP[?'PSLETTERS']+= CURRMAP[?'PSLETTERS']
  OVERMAP[?'PSLETTERSA']+= CURRMAP[?'PSLETTERSA']
  OVERMAP[?'PSLETTERSB']+= CURRMAP[?'PSLETTERSB']
  OVERMAP[?'PSHINTS']+= CURRMAP[?'PSHINTS']
  OVERMAP[?'PSSHIFTSA']+= CURRMAP[?'PSSHIFTSA']
  OVERMAP[?'PSSHIFTSU']+= CURRMAP[?'PSSHIFTSU']
  OVERMAP[?'PSBANNED']+= CURRMAP[?'PSBANNED']
  OVERMAP[?'PSUNBANSA']+= CURRMAP[?'PSUNBANSA']
  OVERMAP[?'PSUNBANSU']+= CURRMAP[?'PSUNBANSU']
  OVERMAP[?'PSBANTYPED']+= CURRMAP[?'PSBANTYPED']
  OVERMAP[?'PSSHORTTYPED']+= CURRMAP[?'PSSHORTTYPED']
  OVERMAP[?'PSWRONGTYPED']+= CURRMAP[?'PSWRONGTYPED']
  OVERMAP[?'PSREPTYPED']+= CURRMAP[?'PSREPTYPED']
  OVERMAP[?'PSLASTSCORE']+= CURRMAP[?'PSLASTSCORE']
  OVERMAP = OVERMAP[?'PSLENGTHMAP']
  var src = ds_map_find_first(LenMap);      //src = key
  var dest;                                 //dest = map
  while (!is_undefined(src))
    {
    dest = OVERMAP[?src]
    if is_undefined(dest)
      {
      dest = ds_map_create()
      ds_map_copy(dest,LenMap[?src])
      ds_map_add(OVERMAP,src,dest)
      }
    else
      {
      tmp = LenMap[?src]
      for(i=0; i<26; i++)
        dest[?funcChrDecode(i)]+= tmp[?funcChrDecode(i)]
      }
    src = ds_map_find_next(LenMap,src)
    }
  }
  
//best game section
OVERMAP = SECTMAP[?GameTypeID+2]
if is_undefined(OVERMAP) {
  OVERMAP = ds_map_create()
  ds_map_copy(OVERMAP,SECTMAP[?GameTypeID+1])
  SECTMAP[?GameTypeID+2] = OVERMAP
  }
else 
  if OVERMAP[?'PSLASTSCORE'] < CURRMAP[?'PSLASTSCORE'] {
    ds_map_copy(OVERMAP,SECTMAP[?GameTypeID+1])
    SECTMAP[?GameTypeID+2] = OVERMAP
    }
    
//write & send stat
funcProfileWrite()
funcSendProfile()
