# FAQ
------

1. How to see DCHP Requests and Response between nodes and undercloud VM
--------------------------------------------------------------------------
  - Command to check on jumphost
```
tcpdump -i br-provision -v -s 1500 '((port 67 or port 68) and (udp[8:1] = 0x1))'
```
  - Command to check on undercloud VM
```
tcpdump -i br-ctlplane -vvv -s 1500 '((port 67 or port 68) and (udp[8:1] = 0x1))'
```
  - Check logs on the undercloud VM
```
sudo journalctl -u openstack-ironic-inspector-dnsmasq
```

2. Steps to recover a node from clean_failed state
--------------------------------------------------
```
openstack baremetal node list
openstack baremetal node maintenance unset <node_uuid> 
ironic --ironic-api-version 1.16 node-set-provision-state <node_uuid> manage
ironic --ironic-api-version 1.16 node-set-provision-state <node_uuid> provide
openstack baremetal node list
```
3. How to run deployment script in debug mode
---------------------------------------------
```
/var/lib/contrail_cloud/scripts/control-hosts-deploy.sh -d
```

4. Steps to add contrail controller if not deployed 
---------------------------------------------------------------------
```
Login to undercloud
openstack baremetal node delete <cc_node_id>
Login to control host using 'contrail' user on which cc did not get deployed
sudo -i
virsh undefine contrail-controller 
vbmc delete contrail-controller
vbmc start contrail-controller
Remove CC information from the facts,
/var/lib/contrail_cloud/facts.d/<control_host_ip>.fact
/var/lib/contrail_cloud/facts.d/control_vms.yml
```
Re-run the deployment scripts from the jumphost
```
/var/lib/contrail_cloud/scripts/control-hosts-deploy.sh 
/var/lib/contrail_cloud/scripts/control-vms-deploy.sh 
/var/lib/contrail_cloud/scripts/openstack-deploy.sh 
```

5. Steps to upgrade CC to minor releases, run following on jumphost
---------------------------------------------------------------------
```
yum update -y
/var/lib/contrail_cloud/contrail_cloud_installer.sh
/var/lib/contrail_cloud/scripts/install_contrail_cloud_manager.sh
```

6. Cleanup the overcloud, step by step from jumphost
---------------------------------------------------------------------
```
/var/lib/contrail_cloud/scripts/openstack-deploy.sh -c
/var/lib/contrail_cloud/scripts/storage-nodes-assign.sh -c
/var/lib/contrail_cloud/scripts/compute-nodes-assign.sh -c
/var/lib/contrail_cloud/scripts/control-vms-deploy.sh -c
/var/lib/contrail_cloud/scripts/control-hosts-deploy.sh -c
/var/lib/contrail_cloud/scripts/inventory-assign.sh -c
```

7. How do I get license keys to test in my lab 
---------------------------------------------------------------------
```
You can request for Contrail Cloud activation keys by sending an
e-mail to contrail_cloud_subscriptions@juniper.net
```

8. Calculate [CEPH PG](https://ceph.com/pgcalc/)


9. Add new compute nodes 
---------------------------------------------------------------------
```
Update inventory.yml && run /var/lib/contrail_cloud/scripts/inventory-assign.sh
Update compute-nodes.yml with new nodes && run /var/lib/contrail_cloud/scripts/compute-nodes-assign.sh
Run /var/lib/contrail_cloud/scripts/openstack-deploy.sh
```

10. Add new storage nodes 
---------------------------------------------------------------------
```
Update inventory.yml && run /var/lib/contrail_cloud/scripts/inventory-assign.sh
Update storage-nodes.yml with new nodes && run /var/lib/contrail_cloud/scripts/storage-nodes-assign.sh
Run /var/lib/contrail_cloud/scripts/openstack-deploy.sh
```

11. Scale down compute nodes 
---------------------------------------------------------------------
```
Update compute-nodes.yml, under the compute which you want to remove with below line
```
status: "deleting"
```
Run /var/lib/contrail_cloud/scripts/compute-remove.sh
```
12. Debugging Mistral 
---------------------------------------------------------------------
- Run below commands on undercloud VM
```
source ~/stackrc
openstack workflow execution list | grep "ERROR" << Get UUID of the FAILED workflow execution
openstack workflow execution show <UUID>         << Failed Task
openstack workflow execution output show <UUID>
openstack workflow definition show <Task_Name>   << Provides full workflow definition
tailf /var/log/mistral/executor.log              << Log file
```
13. Accessing deployment command history
---------------------------------------------------------------------
Check file on undercloud VM
```
cat /home/stack/.tripleo/history
```
14. Accessing logs for Baremetal node provisioning
---------------------------------------------------------------------
Check logs on undercloud VM
```
sudo journalctl -u openstack-ironic-conductor -u openstack-ironic-api
```

15. Check CEPH deployment logs
---------------------------------------------------------------------
Check file on undercloud VM
```
tailf /var/log/mistral/ceph-install-workflow.log
```

16. Reboot undercloud VM
---------------------------------------------------------------------
Check if autostart is enabled for the undercloud, if not enable it 
```
As contrail user on jumphost, `ssh undercloud sudo shutdown -h`
sudo virsh destroy undercloud
sudo shutdown -r 0
```

17. Restart ironic services
---------------------------------------------------------------------
```
sudo systemctl restart ironic-neutron-agent.service
sudo systemctl restart openstack-ironic-conductor.service
sudo systemctl restart openstack-ironic-inspector-dnsmasq.service
sudo systemctl restart openstack-ironic-inspector.service
```

18. Set password for overcloud image for debugging purpose
---------------------------------------------------------------------
```
virt-customize -a images/overcloud-full.qcow2 --root-password password:pass0123
```

19. Move node from clean_failed to clean abort state
---------------------------------------------------------------------
```
openstack baremetal node list
ironic --ironic-api-version 1.16 node-set-provision-state UUID abort
```

20. Move node from clean_failed to manageable state
---------------------------------------------------------------------
```
openstack baremetal node list
ironic node-set-maintenance UUID on
ironic --ironic-api-version 1.16 node-set-provision-state UUID abort
ironic node-set-maintenance UUID off
ironic node-set-provision-state UUID manage
```
21. ccloud CLI extension 
---------------------------------------------------------------------
```
ssh undercloud
source stackrc
openstack ccloud nodemap hosts
openstack ccloud nodemap list
openstack ccloud nodemap show <host-name>
```
22. Removing existing hosts from satellite
---------------------------------------------------------------------
```
./satellite6hosts.py --user <key> --password <passwd> delete --host <host-fqdn-name>
```

## Reference
[CC13 Deployment Guide](https://www.juniper.net/documentation/en_US/contrail5.0/information-products/pathway-pages/contrail-cloud-deployment-guide-13.0.pdf)

[vBMC](https://docs.openstack.org/tripleo-docs/latest/install/environments/virtualbmc.html)

[Ironic state diagram](https://docs.openstack.org/ironic/pike/_images/states.svg)

[Troubleshooting](https://access.redhat.com/documentation/en-us/red_hat_openstack_platform/13/html/director_installation_and_usage/chap-troubleshooting_director_issues)
