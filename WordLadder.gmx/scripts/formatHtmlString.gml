var s = argument0 //input

//parse &#code;
var sym = '';
var rep = '';
for (var i=1; i<= string_length(s); i++) {
    if string_char_at(s,i) == '&'
        if string_char_at(s,i+1) == '#' {
            for (var j=i+2; j<i+6; j++)
                if string_char_at(s,j) == ';'
                    break
                else
                    sym+= string_char_at(s,j)
            rep = chr(real(sym))
            sym = '&#' + sym + ';'
            s = string_replace_all(s, sym, rep)
            sym = '';
            }
    }
    
//parse <tags>
var op = 0
for (var i=1; i<= string_length(s); i++) {
    if string_char_at(s,i) == '<'
        op = i
    if string_char_at(s,i) == '>' && op > 0 {
        s = string_delete(s,op,i-op+1)
        i = op-1
        op = 0
        }
    }
return s
    
//todo apply design
