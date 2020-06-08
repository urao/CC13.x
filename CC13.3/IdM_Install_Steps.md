### Steps to install IdM server on RH7 Enterprise Linux
-------------------------------------------------------

1. Check firewalld service is running
```
systemctl status firewalld.service
```

2. Open required ports and services, run as root user
```
firewall-cmd --permanent --add-port={80/tcp,443/tcp,389/tcp,636/tcp,88/tcp,88/udp,\
              464/tcp,464/udp,53/tcp,53/udp,123/udp}
firewall-cmd --permanent --add-service={freeipa-ldap,freeipa-ldaps,dns}
firewall-cmd --reload
```

3. Install required packages, run as root user
```
yum install ipa-server
ipa-server-install  << Answer the questions during install
kinit admin
yum install python-novajoin
```

4. Run below command to generate OTP for the undercloud to be added in site.yml
```
novajoin-ipa-setup --principal admin --password contrail123 --server <idm-server-fqdn-name> \
--realm <REALM> --domain <domain-name> --hostname <undercloud-fqdn-name> \
--precreate --otp-file /tmp/otp_password
copy the OTP from /tmp/otp_password and update site.yml file
```

#### Alternative option
1. Set up container on jumphost with freeipa
```
https://github.com/freeipa/freeipa-container 
Install nova-join package in container
```
2. Generate OTP for undercloud


## Reference
[IDM Server](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/linux_domain_identity_authentication_and_policy_guide/install-server)

[FreeIPA](https://github.com/freeipa/)

[RPMS](https://access.redhat.com/documentation/en-us/red_hat_openstack_platform/13/html/package_manifest/rhel-7-server-openstack-13-rpms)
