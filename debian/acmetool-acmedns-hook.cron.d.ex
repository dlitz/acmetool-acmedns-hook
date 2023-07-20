#
# Regular cron jobs for the acmetool-acmedns-hook package.
#
0 4	* * *	root	[ -x /usr/bin/acmetool-acmedns-hook_maintenance ] && /usr/bin/acmetool-acmedns-hook_maintenance
