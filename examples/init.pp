# emulate data from hiera - corresponding data structure needs to
# be made in YAML and loaded in via either automatic data binding
# or via a profile 
$custom_entries = [
  {
    "ip"         => "192.168.1.2",
    "short_name" => "demo",
    "fqdn"       => "demo.hosts-example.com",
  },
  {
    "ip"         => "192.168.1.3",
    "short_name" => "demo",
    "fqdn"       => "demo.hosts-example.com.internal",
  },
  {
    "ip"         => "10.15.15.150",
    "short_name" => "demo",
    "fqdn"       => "demo.hosts-example.com.cdn",
  }


]

class { "hosts":
  custom_entries => $custom_entries,
}
