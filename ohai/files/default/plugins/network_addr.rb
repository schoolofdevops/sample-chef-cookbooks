#
# Author:: Joshua Timberman (<joshua@opscode.com>)
# Copyright:: Copyright (c) 2011 Opscode, Inc.
# License:: Apache License, Version 2.0
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

provides "network"

require_plugin "hostname"
require_plugin "#{os}::network"

network['interfaces'].each do |iface, addrs|

  addrs['addresses'].each do |ip, params|
    network["ipaddress_#{iface}"] ||= ip if params['family'].eql?('inet')
    network["ipaddress6_#{iface}"] ||= ip if params['family'].eql?('inet6')
    network["macaddress_#{iface}"] ||= ip if params['family'].eql?('lladdr')
  end

end

network
