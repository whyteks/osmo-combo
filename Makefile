# Use this PREFIX setting if you want to install system wide.
# In this case you must run 'make' under 'sudo'.
#PREFIX=/usr/local
# Use this PREFIX setting if you want to compile without
# installing system wide. No need for 'sudo'.
PREFIX=$(CURDIR)/built
MAKE=make -j4
MAKE_SINGLE=make
MAKE_INSTALL=$(MAKE_SINGLE) install
BUILD_DIR=build
CONF_VARS=CFLAGS="-g -O0 -I$(PREFIX)/include" CXXFLAGS="-g -O0 -I$(PREFIX)/include" LDFLAGS="-g -O0 -L$(PREFIX)/lib" PKG_CONFIG_PATH="$(PREFIX)/lib/pkgconfig"
# Enable the following line to enable statis build. Don't forget
# to run './apply-patches static-build' before compilation to make it successful.
#CONF_PARAMS_STATIC=--enable-static --disable-shared
CONF_PARAMS=--prefix=$(PREFIX) $(CONF_PARAMS_STATIC)


.PHONY: pre  all clean_marks libosmocore libosmo-abis libosmo-netif libosmo-sccp libsmpp34 openbsc osmo-pcu openggsn osmo-gtp-kernel osmo-bts
#osmo-trx

all: libosmocore libosmo-abis libosmo-netif libosmo-sccp libsmpp34 openbsc osmo-pcu openggsn osmo-gtp-kernel osmo-bts osmo-sip-connector
#osmo-trx

pre:
	@mkdir -p $(BUILD_DIR)
	@mkdir -p $(PREFIX)

clean_marks:
	rm *.installed
	rm *.made

###################################################################
# libosmocore

libosmocore: pre $(BUILD_DIR)/libosmocore.installed

$(BUILD_DIR)/libosmocore.installed: $(BUILD_DIR)/libosmocore.made
	$(MAKE_INSTALL) -C $(BUILD_DIR)/libosmocore
	touch $(BUILD_DIR)/libosmocore.installed

$(BUILD_DIR)/libosmocore.made: $(BUILD_DIR)/libosmocore.configured
	$(MAKE) -C $(BUILD_DIR)/libosmocore
	touch $(BUILD_DIR)/libosmocore.made

$(BUILD_DIR)/libosmocore.configured: libosmocore/configure.ac
	( cd libosmocore; autoreconf -fi )
	mkdir -p $(BUILD_DIR)/libosmocore
	cd $(BUILD_DIR)/libosmocore && $(CONF_VARS) ../../libosmocore/configure $(CONF_PARAMS)
	touch $(BUILD_DIR)/libosmocore.configured



###################################################################
# libosmo-abis

libosmo-abis: libosmocore $(BUILD_DIR)/libosmo-abis.installed

$(BUILD_DIR)/libosmo-abis.installed: $(BUILD_DIR)/libosmo-abis.made
	$(MAKE_INSTALL) -C $(BUILD_DIR)/libosmo-abis
	touch $(BUILD_DIR)/libosmo-abis.installed

$(BUILD_DIR)/libosmo-abis.made: $(BUILD_DIR)/libosmo-abis.configured
	$(MAKE) -C $(BUILD_DIR)/libosmo-abis
	touch $(BUILD_DIR)/libosmo-abis.made

$(BUILD_DIR)/libosmo-abis.configured: libosmo-abis/configure.ac
	( cd libosmo-abis; autoreconf -fi )
	mkdir -p $(BUILD_DIR)/libosmo-abis
	cd $(BUILD_DIR)/libosmo-abis && $(CONF_VARS) ../../libosmo-abis/configure $(CONF_PARAMS)
	touch $(BUILD_DIR)/libosmo-abis.configured


###################################################################
# libosmo-netif

libosmo-netif: libosmocore $(BUILD_DIR)/libosmo-netif.installed

$(BUILD_DIR)/libosmo-netif.installed: $(BUILD_DIR)/libosmo-netif.made
	$(MAKE_INSTALL) -C $(BUILD_DIR)/libosmo-netif
	touch $(BUILD_DIR)/libosmo-netif.installed

$(BUILD_DIR)/libosmo-netif.made: $(BUILD_DIR)/libosmo-netif.configured
	$(MAKE) -C $(BUILD_DIR)/libosmo-netif
	touch $(BUILD_DIR)/libosmo-netif.made

$(BUILD_DIR)/libosmo-netif.configured: libosmo-netif/configure.ac
	( cd libosmo-netif; autoreconf -fi )
	mkdir -p $(BUILD_DIR)/libosmo-netif
	cd $(BUILD_DIR)/libosmo-netif && $(CONF_VARS) ../../libosmo-netif/configure $(CONF_PARAMS)
	touch $(BUILD_DIR)/libosmo-netif.configured


###################################################################
# libosmo-sccp

libosmo-sccp: libosmocore $(BUILD_DIR)/libosmo-sccp.installed

$(BUILD_DIR)/libosmo-sccp.installed: $(BUILD_DIR)/libosmo-sccp.made
	$(MAKE_INSTALL) -C $(BUILD_DIR)/libosmo-sccp
	touch $(BUILD_DIR)/libosmo-sccp.installed

$(BUILD_DIR)/libosmo-sccp.made: $(BUILD_DIR)/libosmo-sccp.configured
	$(MAKE) -C $(BUILD_DIR)/libosmo-sccp
	touch $(BUILD_DIR)/libosmo-sccp.made

$(BUILD_DIR)/libosmo-sccp.configured: libosmo-sccp/configure.ac
	( cd libosmo-sccp; autoreconf -fi )
	mkdir -p $(BUILD_DIR)/libosmo-sccp
	cd $(BUILD_DIR)/libosmo-sccp && $(CONF_VARS) ../../libosmo-sccp/configure $(CONF_PARAMS)
	touch $(BUILD_DIR)/libosmo-sccp.configured



###################################################################
# libsmpp34

libsmpp34: libosmocore $(BUILD_DIR)/libsmpp34.installed

$(BUILD_DIR)/libsmpp34.installed: $(BUILD_DIR)/libsmpp34.made
	$(MAKE_INSTALL) -C $(BUILD_DIR)/libsmpp34
	touch $(BUILD_DIR)/libsmpp34.installed

$(BUILD_DIR)/libsmpp34.made: $(BUILD_DIR)/libsmpp34.configured
	$(MAKE_SINGLE) -C $(BUILD_DIR)/libsmpp34
	touch $(BUILD_DIR)/libsmpp34.made

$(BUILD_DIR)/libsmpp34.configured: libsmpp34/configure.ac
	( cd libsmpp34; autoreconf -fi )
	mkdir -p $(BUILD_DIR)/libsmpp34
	cd $(BUILD_DIR)/libsmpp34 && $(CONF_VARS) ../../libsmpp34/configure $(CONF_PARAMS)
	touch $(BUILD_DIR)/libsmpp34.configured



###################################################################
# osmo-pcu

osmo-pcu: libosmocore $(BUILD_DIR)/osmo-pcu.installed

$(BUILD_DIR)/osmo-pcu.installed: $(BUILD_DIR)/osmo-pcu.made
	$(MAKE_INSTALL) -C $(BUILD_DIR)/osmo-pcu
	touch $(BUILD_DIR)/osmo-pcu.installed

$(BUILD_DIR)/osmo-pcu.made: $(BUILD_DIR)/osmo-pcu.configured
	$(MAKE) -C $(BUILD_DIR)/osmo-pcu
	touch $(BUILD_DIR)/osmo-pcu.made

$(BUILD_DIR)/osmo-pcu.configured: osmo-pcu/configure.ac
	( cd osmo-pcu; autoreconf -fi )
	mkdir -p $(BUILD_DIR)/osmo-pcu
	cd $(BUILD_DIR)/osmo-pcu && $(CONF_VARS) ../../osmo-pcu/configure $(CONF_PARAMS)
	touch $(BUILD_DIR)/osmo-pcu.configured


###################################################################
# osmo-gtp-kernel

osmo-gtp-kernel: libosmocore $(BUILD_DIR)/osmo-gtp-kernel.installed
#$(BUILD_DIR)/osmo-gtp-kernel.driver

$(BUILD_DIR)/osmo-gtp-kernel.installed: $(BUILD_DIR)/osmo-gtp-kernel.made
	$(MAKE_INSTALL) -C $(BUILD_DIR)/osmo-gtp-kernel
	touch $(BUILD_DIR)/osmo-gtp-kernel.installed

$(BUILD_DIR)/osmo-gtp-kernel.made: $(BUILD_DIR)/osmo-gtp-kernel.configured
	$(MAKE) -C $(BUILD_DIR)/osmo-gtp-kernel
	touch $(BUILD_DIR)/osmo-gtp-kernel.made

$(BUILD_DIR)/osmo-gtp-kernel.configured: osmo-gtp-kernel/libgtnl/configure.ac
	( cd osmo-gtp-kernel/libgtnl; autoreconf -fi )
	mkdir -p $(BUILD_DIR)/osmo-gtp-kernel
	cd $(BUILD_DIR)/osmo-gtp-kernel && $(CONF_VARS) ../../osmo-gtp-kernel/libgtnl/configure $(CONF_PARAMS)
	touch $(BUILD_DIR)/osmo-gtp-kernel.configured

$(BUILD_DIR)/osmo-gtp-kernel.driver:
	$(MAKE) -C osmo-gtp-kernel
	touch $(BUILD_DIR)/osmo-gtp-kernel.driver


###################################################################
# openggsn

openggsn: libosmocore osmo-gtp-kernel $(BUILD_DIR)/openggsn.installed

$(BUILD_DIR)/openggsn.installed: $(BUILD_DIR)/openggsn.made
	$(MAKE_INSTALL) -C $(BUILD_DIR)/openggsn
	touch $(BUILD_DIR)/openggsn.installed

$(BUILD_DIR)/openggsn.made: $(BUILD_DIR)/openggsn.configured
	$(MAKE) -C $(BUILD_DIR)/openggsn
	touch $(BUILD_DIR)/openggsn.made

$(BUILD_DIR)/openggsn.configured: openggsn/configure.ac
	( cd openggsn; autoreconf -fi )
	mkdir -p $(BUILD_DIR)/openggsn
	cd $(BUILD_DIR)/openggsn && $(CONF_VARS) ../../openggsn/configure --enable-gtp-kernel $(CONF_PARAMS)
	touch $(BUILD_DIR)/openggsn.configured



###################################################################
# openbsc

openbsc: libosmocore libosmo-abis libosmo-netif libsmpp34 osmo-gtp-kernel  $(BUILD_DIR)/openbsc.installed

$(BUILD_DIR)/openbsc.installed: $(BUILD_DIR)/openbsc.made
	$(MAKE_INSTALL) -C $(BUILD_DIR)/openbsc
	touch $(BUILD_DIR)/openbsc.installed

$(BUILD_DIR)/openbsc.made: $(BUILD_DIR)/openbsc.configured
	$(MAKE) -C $(BUILD_DIR)/openbsc
	touch $(BUILD_DIR)/openbsc.made

$(BUILD_DIR)/openbsc.configured: openbsc/openbsc/configure.ac
	( cd openbsc/openbsc; autoreconf -fi )
	mkdir -p $(BUILD_DIR)/openbsc
	cd $(BUILD_DIR)/openbsc && $(CONF_VARS) ../../openbsc/openbsc/configure --enable-smpp --enable-ussd-proxy $(CONF_PARAMS)
	touch $(BUILD_DIR)/openbsc.configured


###################################################################
# osmo-sip-connector

osmo-sip-connector: libosmocore libosmo-abis libosmo-netif $(BUILD_DIR)/osmo-sip-connector.installed

$(BUILD_DIR)/osmo-sip-connector.installed: $(BUILD_DIR)/osmo-sip-connector.made
	$(MAKE_INSTALL) -C $(BUILD_DIR)/osmo-sip-connector
	touch $(BUILD_DIR)/osmo-sip-connector.installed

$(BUILD_DIR)/osmo-sip-connector.made: $(BUILD_DIR)/osmo-sip-connector.configured
	$(MAKE) -C $(BUILD_DIR)/osmo-sip-connector
	touch $(BUILD_DIR)/osmo-sip-connector.made

$(BUILD_DIR)/osmo-sip-connector.configured: osmo-sip-connector/configure.ac
	( cd osmo-sip-connector; autoreconf -fi )
	mkdir -p $(BUILD_DIR)/osmo-sip-connector
	cd $(BUILD_DIR)/osmo-sip-connector && $(CONF_VARS) ../../osmo-sip-connector/configure $(CONF_PARAMS)
	touch $(BUILD_DIR)/osmo-sip-connector.configured


###################################################################
# osmo-bts

osmo-bts: libosmocore $(BUILD_DIR)/osmo-bts.installed

$(BUILD_DIR)/osmo-bts.installed: $(BUILD_DIR)/osmo-bts.made
	$(MAKE_INSTALL) -C $(BUILD_DIR)/osmo-bts
	touch $(BUILD_DIR)/osmo-bts.installed

$(BUILD_DIR)/osmo-bts.made: $(BUILD_DIR)/osmo-bts.configured
	$(MAKE) -C $(BUILD_DIR)/osmo-bts
	touch $(BUILD_DIR)/osmo-bts.made

$(BUILD_DIR)/osmo-bts.configured: osmo-bts/configure.ac
	( cd osmo-bts; autoreconf -fi )
	mkdir -p $(BUILD_DIR)/osmo-bts
	cd $(BUILD_DIR)/osmo-bts && $(CONF_VARS) ../../osmo-bts/configure --enable-trx $(CONF_PARAMS)
	touch $(BUILD_DIR)/osmo-bts.configured



###################################################################
# osmo-trx

osmo-trx: $(BUILD_DIR)/osmo-trx.installed

$(BUILD_DIR)/osmo-trx.installed: $(BUILD_DIR)/osmo-trx.made
	$(MAKE_INSTALL) -C $(BUILD_DIR)/osmo-trx
	touch $(BUILD_DIR)/osmo-trx.installed

$(BUILD_DIR)/osmo-trx.made: $(BUILD_DIR)/osmo-trx.configured
	$(MAKE_SINGLE) -C $(BUILD_DIR)/osmo-trx
	touch $(BUILD_DIR)/osmo-trx.made

$(BUILD_DIR)/osmo-trx.configured: osmo-trx/configure.ac
	( cd osmo-trx; autoreconf -fi )
	mkdir -p $(BUILD_DIR)/osmo-trx
	cd $(BUILD_DIR)/osmo-trx && $(CONF_VARS) ../../osmo-trx/configure --with-sse $(CONF_PARAMS)
	touch $(BUILD_DIR)/osmo-trx.configured

