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
    global.config[?'ProfileFile'] = ''
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

//fix screen res 
//TODO? 
if global.config[?'Fullscreen']
  {
  global.config[?'ScreenW'] = display_get_width()
  global.config[?'ScreenH'] = display_get_height()
  }
