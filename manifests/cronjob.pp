#
define purgefiles::cronjob(
                            $path     = $name,
                            $action   = "-delete",
                            $mtime    = undef,
                            $type     = "f",
                            $hour     = '0',
                            $minute   = '0',
                            $month    = undef,
                            $monthday = undef,
                            $weekday  = undef,
                            $ensure   = 'present',
                            $file_iname     = undef,
                          ) {

  #"find ${path} ${type} -mtime ${mtime} ${action}"
  cron { "cronjob purgefiles ${name} ${path} ${mtime} ${type} ${hour} ${minute} ${month} ${monthday} ${weekday} ${ensure} ${file_iname}":
    ensure   => $ensure,
    command  => inline_template('find <%= @path %> <% if defined?(@file_iname) %>-iname <%= @file_iname %><% end %> <% if defined?(@type) %>-type <%= @type %><% end %> <% if defined?(@mtime) %>-mtime <%= @mtime %><% end %> <%= @action %>'),
    user     => 'root',
    hour     => $hour,
    minute   => $minute,
    month    => $month,
    monthday => $monthday,
    weekday  => $weekday,
  }

}
