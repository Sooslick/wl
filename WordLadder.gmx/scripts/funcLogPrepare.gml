var dir = 'log'
var new = dir + '/latest.log'
var old = dir + '/old.log'
var arch = 'old' + string(current_time) + '.log'
// 0) create logdir if !exists
if !directory_exists(dir)
  directory_create(dir)
// 1) check if logfile too large
var s;
if file_exists(new) {
  var f = file_bin_open(new, 0);
  s = file_bin_size(f);
  file_bin_close(f)
  }
// 2) check DebugMode. If true, archive old logfile w/ unique name
if global.config[?'DebugMode']
  file_rename(new, arch)
// 3) otherwise rewrite old logfile
else if s > 131072 { //128K
  if file_exists(old)
    file_delete(old)
  file_rename(new, old)
  }
// 4) log this event
funcLogString('Init new cfg')
