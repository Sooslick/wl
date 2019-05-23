var f = file_text_open_append('log/latest.log')
file_text_write_string(f, date_datetime_string(date_current_datetime()) + ': ' + argument0)
file_text_writeln(f)
file_text_close(f)
