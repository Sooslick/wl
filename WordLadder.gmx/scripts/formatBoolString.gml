//format string to bool value
//arg0: param
//arg1: default value
var dflt = argument1;
var param = argument0;
if (!is_bool(param))&&(!is_real(param))
  param = dflt
if param
 return 'true'
else
  return 'false'
