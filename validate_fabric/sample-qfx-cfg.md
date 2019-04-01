## Sample reference QFX-5100 configuration
```
set version 14.1X53-D35.3
set system time-zone America/Los_Angeles
set interfaces ge-0/0/17 unit 0 family ethernet-switching vlan members PROVISIONING
set interfaces ge-0/0/18 unit 0 family ethernet-switching vlan members PROVISIONING
set interfaces ge-0/0/19 unit 0 family ethernet-switching vlan members PROVISIONING
set vlans EXTERNAL vlan-id 200
set vlans EXTERNAL l3-interface irb.200
set vlans INTERNAL_API_NET vlan-id 201
set vlans PROVISIONING vlan-id 110
set vlans STORAGE_MGT_NET vlan-id 204
set vlans STORAGE_NET vlan-id 203
set vlans TENANT_NET vlan-id 202
set vlans TENANT_NET l3-interface irb.202
set interfaces xe-0/0/0 unit 0 family ethernet-switching interface-mode trunk
set interfaces xe-0/0/0 unit 0 family ethernet-switching vlan members TENANT_NET
set interfaces xe-0/0/1 unit 0 family ethernet-switching interface-mode trunk
set interfaces xe-0/0/1 unit 0 family ethernet-switching vlan members INTERNAL_API_NET
set interfaces xe-0/0/1 unit 0 family ethernet-switching vlan members MGMT_NET
set interfaces xe-0/0/1 unit 0 family ethernet-switching vlan members STORAGE_MGT_NET
set interfaces xe-0/0/1 unit 0 family ethernet-switching vlan members STORAGE_NET
set interfaces xe-0/0/1 unit 0 family ethernet-switching vlan members EXTERNAL
set interfaces xe-0/0/4 unit 0 family ethernet-switching interface-mode trunk
set interfaces xe-0/0/4 unit 0 family ethernet-switching vlan members TENANT_NET
set interfaces xe-0/0/5 unit 0 family ethernet-switching interface-mode trunk
set interfaces xe-0/0/5 unit 0 family ethernet-switching vlan members INTERNAL_API_NET
set interfaces xe-0/0/5 unit 0 family ethernet-switching vlan members MGMT_NET
set interfaces xe-0/0/5 unit 0 family ethernet-switching vlan members STORAGE_MGT_NET
set interfaces xe-0/0/5 unit 0 family ethernet-switching vlan members STORAGE_NET
set interfaces xe-0/0/5 unit 0 family ethernet-switching vlan members EXTERNAL
set interfaces irb unit 200 family inet address 10.187.5.1/24
set interfaces irb unit 200 family inet6 address fd00:fd00:fd00:3001::1/64
set interfaces irb unit 202 family inet address 172.16.82.254/24
```
