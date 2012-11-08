#!/usr/bin/make -f
# -*- makefile -*-

build:
	export LEIN_ROOT=1; \
		/usr/local/bin/lein uberjar
install: build
	mkdir -p $(DESTDIR)/usr/share/java
	mkdir -p $(DESTDIR)/usr/lib/riemann
	mkdir -p $(DESTDIR)/etc/riemann
	cp pkg/etc/riemann.config.guide /$(DESTDIR)/etc/riemann/riemann.config.guide
	cp riemann.config $(DESTDIR)/etc/riemann/riemann.config
	cp target/riemann-0.1.3-SNAPSHOT-standalone.jar $(DESTDIR)/usr/share/java
	cd $(DESTDIR)/usr/lib/riemann; \
		ln -s ../../share/java/riemann-0.1.3-SNAPSHOT-standalone.jar riemann.jar
clean:
	export LEIN_ROOT=1; \
		/usr/local/bin/lein clean

.PHONY: install build clean
