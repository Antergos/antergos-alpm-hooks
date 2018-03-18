#!/bin/make -f

DESTDIR ?= /

all: install

install:
	# ALPM Hooks
	mkdir -p $(DESTDIR)/usr/share/libalpm/hooks
	cp hooks/antergos-filesystem.hook $(DESTDIR)/usr/share/libalpm/hooks

	# Hook Scripts
	install -Dm755 src/update-release-files $(DESTDIR)/usr/bin/update-release-files

uninstall:
	# ALPM Hooks
	rm -f $(DESTDIR)/usr/share/libalpm/hooks/antergos-filesystem.hook

	# Hook Scripts
	rm -f $(DESTDIR)/usr/bin/update-release-files


.PHONY: all install uninstall
