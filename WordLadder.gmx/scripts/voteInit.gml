//arg0: vote obj
//arg1: vote description
with argument0 {
  Vote = true
  Voted = false
  VoteY = 0
  VoteN = 0
  VoteText = argument1
  
  bVoteY = instance_create(500,1050,oButton)
  bVoteY.content = 'YES'
  bVoteY.parent = id
  bVoteN = instance_create(1100,1050,oButton)
  bVoteN.content = 'NO'
  bVoteN.parent = id
  }
