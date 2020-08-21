purgefiles::cronjob { 'prova':
  path       => '/',
  hour       => '*',
  file_iname => 'core.\*',
  mtime      => '+6',
  xdev       => true,
  maxdepth   => '1',
}
