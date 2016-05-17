# Support adding illegal hostname entries at customer request
#
# WARNING:  This code will completely replace the contents of /etc/hosts
#
# Parameters
# ==========
# [`custom_entries`]
#   Array of customised entries to add or false (the default) to do nothing
#
# custom_entries variable format
# ==============================
# See examples/init.pp for a worked example
#
# * Variable is an array so that order of entries is preserved
# * Each element of the array needs to contain a hash with the following 
#   elements:
#     * `ip` - The IP address
#     * `short_name` - The short name of the host
#     * `fqdn` - The fully qualified hostname of the host
class hosts($custom_entries = false) {

  file { "/etc/hosts":
    ensure  => file,
    owner   => "root",
    group   => "root",
    mode    => "0644",
    content => template("hosts/hosts.erb"),
  }

}
