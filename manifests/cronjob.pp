define purgefiles::cronjob(
                            $path        = $name,
                            $action      = '-delete',
                            $mtime       = undef,
                            $type        = 'f',
                            $hour        = '0',
                            $minute      = '0',
                            $month       = undef,
                            $monthday    = undef,
                            $weekday     = undef,
                            $ensure      = 'present',
                            $file_iname  = undef,
                            $cronjobname = undef,
                            $compress    = false,
                            $xdev        = false,
                            $maxdepth    = undef,
                          ) {

  if($cronjobname!=undef)
  {
    $cron_job_name=$cronjobname
  }
  else
  {
    $cron_job_name="purgefiles ${name} ${path} ${mtime} ${type} ${hour} ${minute} ${month} ${monthday} ${weekday} ${ensure} ${file_iname}"
  }

  cron { $cron_job_name:
    ensure   => $ensure,
    command  => template("${module_name}/purge.erb"),
    user     => 'root',
    hour     => $hour,
    minute   => $minute,
    month    => $month,
    monthday => $monthday,
    weekday  => $weekday,
  }

}
