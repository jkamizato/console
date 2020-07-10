#!/bin/bash

var_function=$1
var_parameter=$2


## functions
jkam_lando_local_import_db()
{
    lando drush sqlc < $var_parameter && lando drush cr && lando drush cim -y && lando drush updb -y && lando drush cr && lando drush uli
}

## Personal commands

if [ -z "$var_function" ]; then
	echo "lando-import-db [../backup.sql]"
fi

if [ "$var_function" == "lando-import-db" ]; then
	jkam_lando_local_import_db
fi
