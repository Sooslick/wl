//read deafult config file
if file_exists(global.cfg)
    {
    f = file_text_open_read(global.cfg)
    var s = 'a';
    var param = '';
    var value = 0;
    var divider = '=';
    //read all fields and divide it to key-value pairs
    while s != ''
      {
      s = file_text_read_string(f)
      param = string_copy(s,1,string_pos(divider,s)-1)
      value = string_copy(s,string_pos(divider,s)+1,string_length(s)-string_pos(divider,s))
      global.config[?param] = value
      file_text_readln(f)
      }
    file_text_close(f)
    }

//fix missing fields
if is_undefined(global.config[?'ShowLogo'])
    global.config[?'ShowLogo'] = 'true'
if is_undefined(global.config[?'FirstLaunch'])
    global.config[?'FirstLaunch'] = 'true'
if is_undefined(global.config[?'ProfileFile'])
    global.config[?'ProfileFile'] = 'anonymous'
if is_undefined(global.config[?'ScreenW'])
    global.config[?'ScreenW'] = string(display_get_width())
if is_undefined(global.config[?'ScreenH'])
    global.config[?'ScreenH'] = string(display_get_height())
if is_undefined(global.config[?'Fullscreen'])
    global.config[?'Fullscreen'] = 'true'
if is_undefined(global.config[?'Widescreen'])
    global.config[?'Widescreen'] = 'true'
if is_undefined(global.config[?'Localization'])
    global.config[?'Localization'] = '0'
if is_undefined(global.config[?'Master'])
    global.config[?'Master'] = '100'
if is_undefined(global.config[?'Sound'])
    global.config[?'Sound'] = '100'
if is_undefined(global.config[?'Music'])
    global.config[?'Music'] = '100'
if is_undefined(global.config[?'SavedIP'])
    global.config[?'SavedIP'] = '127.0.0.1'
if is_undefined(global.config[?'ExtraDict'])
    global.config[?'ExtraDict'] = '1'
if is_undefined(global.config[?'LastHeadline'])
    global.config[?'LastHeadline'] = '1'
if is_undefined(global.config[?'CustomStart'])
    global.config[?'CustomStart'] = '0'
if is_undefined(global.config[?'CustomTimer'])
    global.config[?'CustomTimer'] = '4'
if is_undefined(global.config[?'CustomInc'])
    global.config[?'CustomInc'] = '2'
if is_undefined(global.config[?'CustomDec'])
    global.config[?'CustomDec'] = '0'
if is_undefined(global.config[?'CustomUnbans'])
    global.config[?'CustomUnbans'] = 'true'
if is_undefined(global.config[?'CustomShifts'])
    global.config[?'CustomShifts'] = 'true'
if is_undefined(global.config[?'CustomHints'])
    global.config[?'CustomHints'] = 'true'
if is_undefined(global.config[?'CustomBans'])
    global.config[?'CustomBans'] = '0'
if is_undefined(global.config[?'CustomVowels'])
    global.config[?'CustomVowels'] = '20'
if is_undefined(global.config[?'CustomGreens'])
    global.config[?'CustomGreens'] = '0'
if is_undefined(global.config[?'MultiStart'])
    global.config[?'MultiStart'] = '0'
if is_undefined(global.config[?'MultiTimer'])
    global.config[?'MultiTimer'] = '4'
if is_undefined(global.config[?'MultiInc'])
    global.config[?'MultiInc'] = '2'
if is_undefined(global.config[?'MultiDec'])
    global.config[?'MultiDec'] = '0'
if is_undefined(global.config[?'MultiUnbans'])
    global.config[?'MultiUnbans'] = 'true'
if is_undefined(global.config[?'MultiShifts'])
    global.config[?'MultiShifts'] = 'true'
if is_undefined(global.config[?'MultiHints'])
    global.config[?'MultiHints'] = 'true'
if is_undefined(global.config[?'MultiBans'])
    global.config[?'MultiBans'] = '0'
if is_undefined(global.config[?'MultiVowels'])
    global.config[?'MultiVowels'] = '20'
if is_undefined(global.config[?'MultiGreens'])
    global.config[?'MultiGreens'] = '0'
if is_undefined(global.config[?'MultiMode'])
    global.config[?'MultiMode'] = '0'
if is_undefined(global.config[?'ForceOffline'])
    global.config[?'ForceOffline'] = 'false'
if is_undefined(global.config[?'InteractiveBg'])
    global.config[?'InteractiveBg'] = 'true'
    
//format non-string values
global.config[?'ShowLogo'] = formatBool(global.config[?'ShowLogo'], true)
global.config[?'FirstLaunch'] = formatBool(global.config[?'FirstLaunch'], true)
global.config[?'ScreenW'] = formatReal(global.config[?'ScreenW'], display_get_width())
global.config[?'ScreenH'] = formatReal(global.config[?'ScreenH'], display_get_height())
global.config[?'Fullscreen'] = formatBool(global.config[?'Fullscreen'], true)
global.config[?'Widescreen'] = formatBool(global.config[?'Widescreen'], true)
global.config[?'Localization'] = formatReal(global.config[?'Localization'], 0)
global.config[?'Master'] = formatReal(global.config[?'Master'], 100)
global.config[?'Sound'] = formatReal(global.config[?'Sound'], 100)
global.config[?'Music'] = formatReal(global.config[?'Music'], 100)
global.config[?'ExtraDict'] = formatReal(global.config[?'ExtraDict'], 1)
global.config[?'LastHeadline'] = formatReal(global.config[?'LastHeadline'], 1)
global.config[?'CustomStart'] = formatReal(global.config[?'CustomStart'],0)
global.config[?'CustomTimer'] = formatReal(global.config[?'CustomTimer'],4)
global.config[?'CustomInc'] = formatReal(global.config[?'CustomInc'],2)
global.config[?'CustomDec'] = formatReal(global.config[?'CustomDec'],0)
global.config[?'CustomUnbans'] = formatBool(global.config[?'CustomUnbans'],true)
global.config[?'CustomShifts'] = formatBool(global.config[?'CustomShifts'],true)
global.config[?'CustomHints'] = formatBool(global.config[?'CustomHints'],true)
global.config[?'CustomBans'] = formatReal(global.config[?'CustomBans'],0)
global.config[?'CustomVowels'] = formatReal(global.config[?'CustomVowels'],0)
global.config[?'CustomGreens'] = formatReal(global.config[?'CustomGreens'],0)
global.config[?'MultiStart'] = formatReal(global.config[?'MultiStart'],0)
global.config[?'MultiTimer'] = formatReal(global.config[?'MultiTimer'],4)
global.config[?'MultiInc'] = formatReal(global.config[?'MultiInc'],2)
global.config[?'MultiDec'] = formatReal(global.config[?'MultiDec'],0)
global.config[?'MultiUnbans'] = formatBool(global.config[?'MultiUnbans'],true)
global.config[?'MultiShifts'] = formatBool(global.config[?'MultiShifts'],true)
global.config[?'MultiHints'] = formatBool(global.config[?'MultiHints'],true)
global.config[?'MultiBans'] = formatReal(global.config[?'MultiBans'],0)
global.config[?'MultiVowels'] = formatReal(global.config[?'MultiVowels'],0)
global.config[?'MultiGreens'] = formatReal(global.config[?'MultiGreens'],0)
global.config[?'MultiMode'] = formatReal(global.config[?'MultiMode'],0)
global.config[?'ForceOffline'] = formatBool(global.config[?'ForceOffline'],false)
global.config[?'InteractiveBg'] = formatBool(global.config[?'InteractiveBg'],true)

//fix screen res 
//TODO? 
if global.config[?'Fullscreen']
  {
  global.config[?'ScreenW'] = display_get_width()
  global.config[?'ScreenH'] = display_get_height()
  }
