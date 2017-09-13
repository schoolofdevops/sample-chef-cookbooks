case node['platform_family']
when 'rhel'
  default['ntp']['service'] = 'ntpd'
else
  default['ntp']['service'] = 'ntp'
end

default['org']['name'] = "School of Devops"

