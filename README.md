# puppet-openldap-custom

Overview
--------

This is a project to test how can we work with puppet and openldap.

Defined tasks are:
- Install OpenLDAP and configure a database
- Apply a LDAP schema
- Configure a regular backup

Requirements
------------
Module "camptocamp-openldap".

Installed with command: `puppet module install camptocamp-openldap`

All credit to them:
- https://forge.puppet.com/camptocamp/openldap
- https://github.com/camptocamp/puppet-openldap

Usage:
------
Define a node on your puppet master server with configuration provided in the manifest `site.pp`.
