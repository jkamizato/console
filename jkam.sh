#!/bin/bash

var_function=$1
var_parameter=$2

## functions
jkam_lando_local_import_db()
{
	lando drush sql-drop -y && \
	gunzip -c $var_parameter | lando drush sqlc && \
	lando drush cr && \
	lando drush cim -y && \
	lando drush updb -y && \
	lando drush cr && \
	lando drush uli
}

jkam_git_log() {
	git log --oneline --graph --decorate --all
}


## Personal commands

if [ -z "$var_function" ]; then
    echo "lando-import-db [../backup.sql]"
fi


case "$var_function" in
	"lando-import-db")
		jkam_lando_local_import_db
		;;
	"git-log")
		jkam_git_log
		;;
	*)
		;;
esac

