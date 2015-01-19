PROG = dd-iso
VERSION = $(shell grep ^version dd-iso | cut -d= -f2)
INSTALL_DIR = /usr
DESK_DIR = /usr/share/applications
CONF_DIR = /usr/share/dd-iso
ICONS = /usr/share/pixmaps
LOCAL_DIR = /usr/share/locale

all:
	@echo 'try: '
	@echo ' make install'

dist:
	@echo creating dist tarball
	@tar czf $(PROG)-$(VERSION).tgz $(PROG) README.md bg.po dd-iso.desktop

install:
	@echo installing all files
	@install -c -d $(DESK_DIR)
	@install -c -d $(CONF_DIR)
	@install -c -d $(ICONS)
	@install -c -m 755 $(PROG) $(INSTALL_DIR)/bin/$(PROG)
	@install -c -m 644 dd-iso.desktop $(DESK_DIR)
	@msgfmt --output-file=$(LOCAL_DIR)/bg/LC_MESSAGES/$(PROG).mo bg.po

uninstall:
	@echo removing all files
	@rm -f $(INSTALL_DIR)/bin/$(PROG)
	@rm -f $(DESK_DIR)/$(PROG).desktop
	@rm -f $(LOCAL_DIR)/bg/LC_MESSAGES/$(PROG).mo
