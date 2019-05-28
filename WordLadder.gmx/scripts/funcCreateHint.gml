HintObj = instance_create(0,0,oSquareHint)
HintObj.parent = id
HintObj.HINT_WORD = funcGetHintWord()
with HintObj {event_user(0)}
HintTimer += 1111
Stat.hints++
