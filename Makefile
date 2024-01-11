PREFIX ?= /usr/local
ROOT = gproto
CONTENT = $(ROOT).tmac
MANPAGE = $(ROOT).7

TMAC_DIR = /usr/share/groff/site-tmac

install:
	# make sure target directories exist:
	mkdir --mode=755 -p $(TMAC_DIR)
	mkdir --mode=755 -p $(PREFIX)/share/man/man7
	# install the software
	install -D --mode=775 $(CONTENT) $(TMAC_DIR)
	soelim $(MANPAGE) | gzip -c - > $(PREFIX)/share/man/man7/$(MANPAGE).gz
	mandb

uninstall:
	rm -f $(TMAC_DIR)/$(CONTENT)
	rm -f $(PREFIX)/share/man/man7/$(MANPAGE).gz
