node "openldap-server" {
        # Install OpenLDAP and configure a database
        class { 'openldap::server':
                ldaps_ifs => ['/'],
        }
        openldap::server::database { 'dc=demo,dc=domain.local':
                ensure => present,
                directory => '/var/lib/ldap/demo',
                rootdn => 'cn=admin,dc=demo,dc=domain.local',
                rootpw => 'secret',
        }
        openldap::server::access { 'to * by dn="cn=admin,dc=demo,dc=domain.local" on dc=demo,dc=domain.local':
                access => 'write';
        }

        # Apply a LDAP schema of your choice
        openldap::server::schema { 'openldap':
                ensure  => present,
        }

        # Configure a regular backup of the LDAP database
        file { '/etc/openldap/backups':
                ensure => 'directory',
                owner  => 'root',
                group  => 'root',
                mode   => '0700',
        }
        cron { 'backup':
                command => '/usr/sbin/slapcat -l /etc/openldap/backups/backup_`date "+\%Y\%m\%d"`.ldid',
                user    => 'root',
                hour    => '3',
                minute  => '0',
        }
}
