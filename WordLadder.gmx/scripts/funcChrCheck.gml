s = argument0
ok = true
for (i=1; i<=string_length(s); i++)
  {
  c = ord(string_char_at(s,i))
  if ((c>=48)&&(c<=57))||((c>=65)&&(c<=90))
    continue
  else
    {
    ok = false
    break
    }
  }
return ok
