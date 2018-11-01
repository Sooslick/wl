//format string to bool value
//arg0: string param
//arg1: default value
var dflt = argument1;
var str = argument0;

if is_real(str)
  return str
else 
//в гамемакере нет блока try catch
  return(real(str))
//поэтому этот блок никогда не выполнится даже если выпадет ошибка
//TODO fix?
return dflt
