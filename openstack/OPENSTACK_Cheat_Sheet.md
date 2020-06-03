## Cheat sheet to create openstack objects 
#### Tested on Redhat 7.6 ES + RHOSP13 + CN 5.x

1. Create project under a domain and assign role
```
openstack domain list
openstack project create --domain domain1 --description "LDAP testing project" LDAP_TEST
openstack user list --domain domain1
openstack role add --project LDAP_TEST --user contrail01 --user-domain domain1 admin
openstack role add --project LDAP_TEST --user contrail01 --user-domain domain1 _member_
```
2. Create keystone v3 token with domain-id 
```
cat > body.json << EOM
{
      "auth": {
           "identity": {
               "methods": [
                   "password"
               ],
               "password": {
                   "user": {
                       "domain": {"id":"DOMAIN1"},
                       "name": "domain1user",
                       "password": "PASSWORD!!"
                   }
               }
           }
       }
}
EOM
curl -k -i -H "Content-Type: application/json" -d @./body.json https://<VIP_ADDRESS>:13000/v3/auth/tokens
```
3. Create token using command line
```
openstack --os-auth-url https://[VIP_ADDRESS]:13000  --os-identity-api-version 3 --os-project-domain-name DOMAIN1 --os-user-domain-name DOMAIN1 --os-project-name PROJECT_NAME --os-username domain1user token issue
```
## Reference
[keystone_users](https://docs.openstack.org/mitaka/install-guide-obs/keystone-users.html)
[manage_project_users_roles](https://docs.openstack.org/keystone/latest/admin/cli-manage-projects-users-and-roles.html)
