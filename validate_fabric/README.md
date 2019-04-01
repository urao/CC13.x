## Fabric Validation

Validate the underlay network connectivity before deployment using OVS
----------------------------------------------------------------------

* Boot the server/node with Centos/RedHat OS.
* Run the [script](https://github.com/urao/CC13.x/blob/master/validate_fabric/install_pkgs.sh) to install required packages
* These scripts are based on the below topology

![Physical Node](../demo/images/topo1.png)
* interface for PXE boot
* single interface for internal_api, storage, storage_mgt, external networks
* single interface for tenant network


## Reference
[Contrail Tripleo Heat Templates](https://github.com/Juniper/contrail-tripleo-heat-templates/blob/stable/queens/docu/dpdk_vlan.md)

[RHOSP Doc](https://access.redhat.com/documentation/en-us/red_hat_openstack_platform/9/html/ipv6_networking_for_the_overcloud/configuring_the_overcloud_before_creation)
