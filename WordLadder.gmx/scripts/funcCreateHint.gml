HintObj = instance_create(0,0,oSquareHint)
HintObj.HINT_WORD = funcGetHintWord()
HintObj.parent = id
with HintObj {event_user(0)}
HintTimer += 1111
Stat.hints++
