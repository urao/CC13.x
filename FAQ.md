# FAQ
------

1. How to see DCHP Requests and Response between nodes and undercloud VM
--------------------------------------------------------------------------
```
tcpdump command to check on jumphost
tcpdump -i br-provision -v -s 1500 '((port 67 or port 68) and (udp[8:1] = 0x1))'
```
```
tcpdump command to check on undercloud VM
tcpdump -i br-ctlplane -vvv -s 1500 '((port 67 or port 68) and (udp[8:1] = 0x1))'
```

2. Steps to recover a node from clean_failed state
--------------------------------------------------
```
openstack baremetal node list
openstack baremetal node maintenance unset <node_uuid> 
ironic --ironic-api-version 1.16 node-set-provision-state <node_uuid> abort
ironic --ironic-api-version 1.16 node-set-provision-state <node_uuid> manage
ironic --ironic-api-version 1.16 node-set-provision-state <node_uuid> available
ironic --ironic-api-version 1.16 node-set-provision-state <node_uuid> provide
openstack baremetal node list
```
3. How to run deployment script in debug mode
---------------------------------------------
Run the script with '-d' option, Example
```
/var/lib/contrail_cloud/scripts/control-hosts-deploy.sh -d
```

4. Steps to upgrade CC to minor releases, run following on jumphost
---------------------------------------------------------------------
```
yum update -y
/var/lib/contrail_cloud/contrail_cloud_installer.sh
/var/lib/contrail_cloud/scripts/install_contrail_cloud_manager.sh
```

## Reference
[CC13 Deployment Guide](https://www.juniper.net/documentation/en_US/contrail5.0/information-products/pathway-pages/contrail-cloud-deployment-guide-13.0.pdf)
