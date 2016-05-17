# test data format from Hiera
$custom_entries = hiera("profile::hosts::custom_entries")
class { "hosts":
  custom_entries => $custom_entries,
}
