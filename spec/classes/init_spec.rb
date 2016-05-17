require 'spec_helper'
describe 'hosts' do

  context 'with default values for all parameters' do
    it { should compile }
  end

  context 'with custom_entries' do
    let :params do 
      {
        :custom_entries => [
          {
            "ip"         => "192.168.1.2",
            "short_host" => "demo",
            "fqdn"       => "demo.hosts-example.com",
          },
          {
            "ip"         => "192.168.1.3",
            "short_host" => "demo",
            "fqdn"       => "demo.hosts-example.com.internal",
          },
          {
            "ip"         => "10.15.15.150",
            "short_host" => "demo",
            "fqdn"       => "demo.hosts-example.com.cdn",
          }
        ]
      }
    end
    it { should compile }
  end 
end
