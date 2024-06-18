# DESY system

## sssd

* sudo apt install sssd
* use /etc/sssd/sssd.conf from https://it.desy.de/services/directory_services/ldap/index_eng.html
* add "override_homedir = /home/%u" to "domain/LDAP" section of /etc/sssd.conf
* run pam-auth-update, select "Create home directory on login"

## sudo

* run `visudo`, add user account to "User privilege specification"


