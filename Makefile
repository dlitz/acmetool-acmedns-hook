DESTDIR ?= tmp/output
INSTALL ?= install

all:

clean:

mrproper: clean
	rm -rf tmp/output
	-rmdir --ignore-fail-on-non-empty --parents tmp

install:
	umask 022
	mkdir -p $(DESTDIR)/usr/lib/acmetool-acmedns-hook
	#cp -t $(DESTDIR)/usr/lib/acmetool-acmedns-hook hooks/acme-dns
	git archive --format=tar HEAD hooks/acme-dns | tar -xOf - > $(DESTDIR)/usr/lib/acmetool-acmedns-hook/acme-dns
	chmod +x $(DESTDIR)/usr/lib/acmetool-acmedns-hook/acme-dns

	mkdir -p $(DESTDIR)/etc/acme/hooks
	$(INSTALL) -m0755 hooks/acme-dns.stub $(DESTDIR)/etc/acme/hooks/acme-dns

.PHONY: all install clean
