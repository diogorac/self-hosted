## self-hosting

* Using mTLS for all exposed services except DAV, since Joplin does not support it.
  * Needs CA, cert and key on ./certs for traefik
* Nextcloud is used with Cryptomator.
  * Can be backed up with `./scripts/backup-nextcloud.sh`
* Forked nitter
  * Uses feetter on the background to manage follows/lists/feeds


---

`.env`
```
NEXTCLOUD_HOSTNAME=
NEXTCLOUD_ADMIN_USER=
NEXTCLOUD_ADMIN_PASSWORD=
POSTGRES_PASSWORD=

WALLABAG_HOSTNAME=
WALLABAG_DB_ROOT_PASS=
WALLABAG_DB_PASS=
WALLABAG_URL=

TEDDIT_HOSTNAME=

NITTER_HOSTNAME=

INVIDIOUS_HOSTNAME=

TRAEFIK_HOSTNAME=

SEARX_HOSTNAME=
MORTY_KEY=
MORTY_HOSTNAME=

NORDVPN_USER=
NORDVPN_PASS=

CLOUD_HOSTNAME=

DAV_HOSTNAME=
DAV_USER=
DAV_PASS=

FEETTER_USER=
FEETTER_HOSTNAME=
```