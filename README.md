acme-dns hook for acmetool
==========================

This is a work in progress.

This is an [acmetool](https://github.com/hlandau/acme) DNS validation hook
script and client for [joohoi's acme-dns server](https://github.com/joohoi/acme-dns).

Installation instructions
=========================

Copy the hook script to `/etc/acme/hooks/`.

Command-line usage
==================

```
Usage: acmetool-acmedns-hook register [domain [server-url]]
       acmetool-acmedns-hook challenge-dns-start domain target-file txt-content

Examples:
       acmetool-acmedns-hook register foo.example.com
       acmetool-acmedns-hook register foo.example.com https://acme-dns.example.net/
       acmetool-acmedns-hook register DEFAULT https://acme-dns.example.net/
```
