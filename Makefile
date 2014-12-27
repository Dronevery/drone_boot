PREFIX=/usr/dronevery
DESTDIR=
LOGDIR=/var/log/dronevery
CONFDIR=/etc/dronevery

INSTDIR=$(DESTDIR)$(PREFIX)

all:
	@echo do nothing. try one of the targets:
	@echo
	@echo "  install"
	@echo "  uninstall"


install:
	install -d $(INSTDIR)
	install -d $(LOGDIR)
	install -d $(CONFDIR)


	install -m 744 -t $(CONFDIR)	config/env.sh
	install -m 544 -T /etc/rc.local	/etc/rc.local.save
	install -m 755 -T src/rc.local	/etc/rc.local
	install -m 754 -t $(INSTDIR)	src/main.local src/net src/log src/config src/communication

uninstall:
	rm -rf $(INSTDIR) $(CONFDIR)
	install -m 755 -T /etc/rc.local.save	/etc/rc.local
