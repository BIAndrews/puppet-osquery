# define osquery::config - manage json config in pack file
define osquery::pack(
  $pack_file  = $::osquery::settings['packs'][$title],
  $format     = 'simple',
  $pack_input = hiera_hash("osquery::pack::${title}", undef),
) {

  # Get the input from hiera
  if $pack_config {
    file { $pack_file:
      ensure  => present,
      owner   => 'root',
      group   => 'root',
      content => sorted_json($pack_input, $format), # convert to JSON
      require => Package[$::osquery::package_name],
      notify  => Service[$::osquery::service_name],
    }
  }
}
