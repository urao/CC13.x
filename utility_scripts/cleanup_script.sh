#!/bin/bash

y | /var/lib/contrail_cloud/scripts/install_contrail_command.sh -c
y | /var/lib/contrail_cloud/scripts/appformix-deploy.sh -c
y | /var/lib/contrail_cloud/scripts/openstack-post-deploy.sh -c
y | /var/lib/contrail_cloud/scripts/openstack-deploy.sh -c
y | /var/lib/contrail_cloud/scripts/storage-nodes-assign.sh -c
y | /var/lib/contrail_cloud/scripts/compute-nodes-assign.sh -c
y | /var/lib/contrail_cloud/scripts/control-vms-deploy.sh -c
y | /var/lib/contrail_cloud/scripts/control-hosts-deploy.sh -c
y | /var/lib/contrail_cloud/scripts/inventory-assign.sh -c
N | /var/lib/contrail_cloud/scripts/install_contrail_cloud_manager.sh -c
