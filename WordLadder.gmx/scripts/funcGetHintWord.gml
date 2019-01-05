var word = '';
var found = false;
var wordlong = '';
var foundlong = false;
var longlen = 0;
var attempts = irandom_range(1, 100 div MinLen);
//currword: from Ruler
//MinLen: from Ruler
//TabuList: from Ruler
//prevWordList: from Ruler

//select lv1 map
var m = global.DictDS[? string_char_at(currWord,1)];
if m != -1
  {
  //for each lv2 map
  for (var i=0; i<26; i++)
    {
    var l = m[? chr(funcChrDecode(i))] 
    if l != -1
      {
      //for each word
      for (var j=0; j<ds_list_size(l); j++)
        {
        var w = l[| j]
        //check len
        if string_length(w) < MinLen
          continue
        //check prev words
        if wordlistTyped(wl,w, false) != -1
          continue
        //check tabus
        var ok = true
        for (k=2; k<=string_length(w); k++)
          {
          var tmp = ds_list_find_index(TabuList, string_char_at(w,k))
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
