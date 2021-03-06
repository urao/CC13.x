## Cheat sheet to run useful commands on CC13.x deployed cluster 
#### Tested on Redhat 7.6 ES + RHOSP13 + CN 5.x

1. Below are some of the useful commands 
```
/var/log/contrail_cloud/*         << Log location on undercloud VM
/var/log/contrail_cloud/*         << Ansible logs on Jumphost 
sudo vbmc list                    << Run on controller hosts to check port#
yum list installed | grep cloud   << Version of CC installed on jumphost
rpm -qa | grep contrail           << Version of CN installed on undercloud
/var/log/mistral/*.log            << Mistral logs on undercloud
/var/log/ironic/*                 << Ironic logs on undercloud
/var/log/messages                 << Logs on undercloud
tailf /var/log/contrail_cloud/create-stack.log  << Check progress of the stack creation on undercloud VM
```

2. Introspection data for all the nodes is saved, check:
```
ls -l /var/lib/contrail_cloud/introspection/*.introspection
yum install jq -y
Example: 
cat ceph-host003.introspection |  jq .inventory.disks
cat ceph-host003.introspection |  jq .root_disk
```

3. Openstack commands on undercloud
```
openstack baremetal node list
openstack server list
openstack network list
openstack subnet show ctlplane-subnet
openstack stack list
openstack catalog list
```

4. Openstack commands on overcloud
```
openstack overcloud profiles list
openstack overcloud plan list
openstack stack failures list --long overcloud
openstack stack list --nested --property status=FAILED
openstack stack resource list overcloud --filter status=FAILED
openstack stack resource list overcloud | grep -v COMPLETE
openstack stack resource show overcloud [FAILED RESOURCE]
openstack stack event list overcloud --nested-depth 5 --follow
openstack stack output show overcloud HostsEntry -f value -c output_value
openstack server list
openstack network list
openstack flavor list
nova list
```

5. Cleanup the overcloud, step by step from jumphost
```
/var/lib/contrail_cloud/scripts/openstack-deploy.sh -c
/var/lib/contrail_cloud/scripts/storage-nodes-assign.sh -c
/var/lib/contrail_cloud/scripts/compute-nodes-assign.sh -c
/var/lib/contrail_cloud/scripts/control-vms-deploy.sh -c
/var/lib/contrail_cloud/scripts/control-hosts-deploy.sh -c
/var/lib/contrail_cloud/scripts/inventory-assign.sh -c
```

## Reference
[CC13 Deployment Guide](https://www.juniper.net/documentation/en_US/contrail5.0/information-products/pathway-pages/contrail-cloud-deployment-guide-13.0.pdf)

[PG CALCULATION](https://ceph.com/pgcalc/)
