#
define purgefiles::cronjob(
                            $path=$name,
                            $mtime,
                            $action="-delete",
                            $type="-type f",
                            $hour='0',
                            $minute='0',
                            $month=undef,
                            $monthday=undef,
                            $weekday=undef,
                            $ensure='present',
                          ) {

  cron { "cronjob purgefiles ${name}":
    command  => "find ${path} ${type} -mtime ${mtime} ${action}",
    user     => 'root',
    hour     => $hour,
    minute   => $minute,
    month    => $month,
    monthday => $monthday,
    weekday  => $weekday,
    ensure   => $ensure,
  }

}
