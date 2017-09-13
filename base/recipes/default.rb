user 'deploy' do
  uid 5001
  home '/home/deploy'
  manage_home  true
  password '$1$UigpUSrC$PVl.4i3ll/VBjO38/Lk2q0'
  action :create
end

package [ 'ntp', 'tree', 'ntp', 'unzip', 'wget' ]


user 'dojo' do
  action :remove
end

template '/etc/motd' do 
  source 'motd.erb'
  owner 'root'
  group 'root'
  mode  0644
end


service node['ntp']['service'] do 
  action [ :start, :enable ]
end
