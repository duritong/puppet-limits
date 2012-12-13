# Manage a limits.d entry
define limits::entry(
  $user,
  $limit_type,
  $ensure = present,
  $hard = undef,
  $soft = undef
) {

  if $name =~ /.conf$/ {
    $target_file = "/etc/security/limits.d/${name}"
  } else {
    $target_file = "/etc/security/limits.d/${name}.conf"
  }

  file { $target_file:
    ensure  => $ensure,
    content => template('limits/limits.erb'),
    owner   => 'root',
    group   => 'root',
    mode    => '0644';
  }
}
