//arg0: isActive
var k = ds_map_find_first(global.uiObjects)
if argument0 {                  //active -> true
  while !is_undefined(k) {
    if global.uiObjects[?k] == true {
      k.clickable = true;
      global.uiObjects[?k] = false;
      }
    k = ds_map_find_next(global.uiObjects, k)
    }
  }
else {                          //active -> false
  while !is_undefined(k) {
    if k.clickable {
      //switch clickable and remember it in hashmap
      k.clickable = false;
      global.uiObjects[?k] = true;
      }
    k = ds_map_find_next(global.uiObjects, k)
    }
  }
