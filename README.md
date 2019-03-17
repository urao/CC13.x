# Contrail Cloud Overview 
----------------------------
Juniper Networks Contrail Cloud is an integrated Telco Cloud platform built to run high-performance NFV with always-on reliability, allowing service providers to deliver innovative services with greater agility. Contrail Cloud Release 13.1 features Red Hat OpenStack combined with Juniper Contrail Networking, thereby bridging dynamic cloud orchestration with highly scalable connectivity. Furthermore, Contrail Cloud leverages AppFormix which has a built-in automation capability powered by machine learning to run the cloud infrastructure and VNFs in the most optimal manner, and remediating any potential failures to ensure adherence to SLAs.

### CC Controllers Topology 
-----------------------------
![Controller Topology](images/cc_controllers.png)

### CC Compute and Storage Topology 
-----------------------------
![Compute and Storage Topology](images/cc_compute_storage.png)


### CC Features tested 
-----------------------
1. IPv6 addressing support on External, Storage and Storage Mgmt networks
2. LDAP backend integration with keystone
3. Disk labeling
4. Multi-tenant subnet
5. Multiple role profiles
6. Proxy
7. Control VM's placement

### Build of Materials(BOM) for this Demo
-----------------------------------------
* 1 QFX5100
* 6 Servers
  * 1 Jumphost
  * 3 Control Host
  * 1 DPDK Compute
  * 1 Kernel Compute

### Prerequisites for Deploying Contrail Cloud
----------------------------------------------
* Bringup the infrastructure based on the above reference topology
* Every system have access to Contrail Cloud repository satellite
* Setup undercloud Host

### Install Contrail Cloud
--------------------------
* Bringup the infrastructure based on the above reference topology


## Reference
[CC13 Deployment Guide](https://www.juniper.net/documentation/en_US/contrail5.0/information-products/pathway-pages/contrail-cloud-deployment-guide-13.0.pdf)                                 
