word = ''
found = false
wordlong = ''
foundlong = false
longlen = 0
attempts = irandom_range(1, 100 div MinLen)
//currword: from Ruler
//MinLen: from Ruler
//TabuList: from Ruler
//prevWordList: from Ruler

//select lv1 map
m = global.DictDS[? string_char_at(currWord,1)]
if m != -1
  {
  //for each lv2 map
  for (i=0; i<26; i++)
    {
    l = m[? chr(funcChrDecode(i))] 
    if l != -1
      {
      //for each word
      for (j=0; j<ds_list_size(l); j++)
        {
        w = l[| j]
        //check len
        if string_length(w) < MinLen
          continue
        ok = true
        //check prev words
        if ds_list_find_index(prevWordList,w) != -1
          ok = false
        //check tabus
        if ok
          for (k=2; k<=string_length(w); k++)
            {
            tmp = ds_list_find_index(TabuList, string_char_at(w,k))
            if (tmp != -1)
              {
              ok = false 
              break
              } 
            }
        if !ok
          continue
        if string_length(w) > MinLen
          {
          if foundlong
            {
            if string_length(w) < longlen
              {
              wordlong = w
              longlen = string_length(w)
              }
            }
          else
            {
            foundlong = true
            longlen = string_length(w)
            wordlong = w
            }
          }
        else
          {
          found = true
          word = w
          attempts--
          if attempts == 0   
            return word
          }       
        }
      }
    }
  }
if found
  return word
if foundlong
  return wordlong
else
  return ''
