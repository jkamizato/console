#!/bin/bash

var_function=$1
var_parameter=$2

## functions
jka_lando_local_import_db()
{
	lando drush sql-drop -y && \
	gunzip -c $var_parameter | lando drush sqlc && \
	lando drush cr && \
	lando drush cim -y && \
	lando drush updb -y && \
	lando drush cr && \
	lando drush uli
}

jka_gitlog() {
	git log --oneline --graph --decorate --all
}

jka_clean_phpstorm() {
	rm -rf ~/.java/.userPrefs/jetbrains
	rm -rf ~/.config/JetBrains
	rm -rf ~/.cache/JetBrains
}

jka_sound() {
	aplay ~/.config/console/musical100.wav -q
}

jka_dreamhost() {
	ssh dh_4fryyy@ferndale.dreamhost.com
}

jka_remove_old_snaps() {
	LANG=en_US.UTF-8 snap list --all | awk '/disabled/{print $1, $3}' |
    	while read snapname revision; do
        	snap remove "$snapname" --revision="$revision"
    	done
}



## Personal commands

if [ -z "$var_function" ]; then
    echo "lando-import-db [../backup.sql]"
    echo "gitlog"
    echo "clean-phpstorm"
    echo "jka sound"
    echo "jka dreamhost"
    echo "jka remove-old-snaps"
fi


case "$var_function" in
	"lando-import-db")
		jka_lando_local_import_db
		;;
	"gitlog")
		jka_gitlog
		;;
	"clean-phpstorm")
		jka_clean_phpstorm
		;;
	"sound")
		jka_sound
		;;
	"dreamhost")
		jka_dreamhost
		;;
	"remove-old-snaps")
		jka_remove_old_snaps
		;;
	*)
		;;
esac