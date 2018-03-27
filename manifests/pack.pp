# define osquery::pack - manage json config in pack file
define osquery::pack(
  $pack_file  = $::osquery::settings['packs'][$title],
  $format     = 'simple',
  $pack_input = hiera_hash("osquery::pack::${title}", undef),
  $owner      = 'root',
  $group      = 'root',
) {

  # Get the input from hiera
  if $pack_input {
    file { $pack_file:
      ensure  => present,
      owner   => $owner,
      group   => $group,
      content => osquery_sorted_json($pack_input, $format), # convert to JSON
      require => Package[$::osquery::package_name],
      notify  => Service[$::osquery::service_name],
    }
  }
}
