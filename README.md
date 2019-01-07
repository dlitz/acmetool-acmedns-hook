acme-dns hook for acmetool
==========================

This is a work in progress.

Quickstart (for octopi)
-----------------------

* apt install acmetool
* Install hooks/acme-dns to /etc/acme/hooks/acme-dns
* Create /etc/default/acme-dns with the following contents (edit for your site):
	ACMEDNS_REGISTER_URL=https://acme-dns.example.net/register
	ACMEDNS_UPDATE_URL=https://acme-dns.example.net/update
* /etc/acme/hooks/acme-dns register octopi.example.net
* Install the CNAME record in the DNS
* (Optional) Edit /etc/haproxy/haproxy.cfg (do not restart haproxy; we'll let acmetool do that)
	* replace this:
		bind :::80 v4v6
		bind :::443 v4v6 ssl crt /etc/ssl/snakeoil.pem
	* with this:
		#bind :::80 v4v6
		bind :::443 v4v6 ssl crt /var/lib/acme/live/octopi.example.net/haproxy
* (Optional) Write /var/lib/acme/conf/responses:
	"acme-enter-email": "dlitz@dlitz.net"
	"acme-agreement:https://letsencrypt.org/documents/LE-SA-v1.2-November-15-2017.pdf": true
* Run acmetool quickstart
	* Staging
	* HOOK
	* cronjob? no  — systemd takes care of it
* (Optional) Edit /var/lib/acme/conf/target to change key type from `rsa` to `ecdsa`
* acmetool want --no-reconcile octopi.example.net
* systemctl enable acmetool.timer
* systemctl start acmetool.timer acmetool.service
