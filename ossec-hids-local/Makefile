DESTDIR=/
TARGET_ROOT=target_root
DIR=${TARGET_ROOT}/opt/obsrvbl-ossec
TARGET ?= local
VERSION ?= 2.8.3
PREFIX ?= /opt/obsrvbl-ossec

all:
	touch src/Config.OS
	sed -i '/CEXTRA.*/d' src/Config.OS
	echo "CEXTRA=-DLOCAL" >> src/Config.OS
	(cd src; make PREFIX=$(PREFIX) TARGET=$(TARGET) all; make PREFIX=$(PREFIX) TARGET=$(TARGET) build)	

clean:
	rm bin/* || /bin/true
	mkdir -p ${DIR}/rules/translated/
	chmod 750 ${DIR}
	chmod 750 ${DIR}/*
	chmod 750 ${DIR}/rules/translated/
	chmod 750 ${DIR}/rules/translated/* || /bin/true
	(cd src; make clean)
	rm -f src/Config.OS
	rm -f src/analysisd/compiled_rules/compiled_rules.h
	rm -f src/isbigendian.c
	rm -f src/analysisd/ossec-makelists
	rm -f src/analysisd/ossec-logtest
	rm -f src/isbigendian

install:
	# Adaptation of the install-common target in src/Makefile
	mkdir -p ${DIR}
	mkdir -p ${DIR}/logs
	touch ${DIR}/logs/ossec.log

	mkdir -p ${DIR}/bin
	mkdir -p ${DIR}/lua
	mkdir -p ${DIR}/lua/native
	mkdir -p ${DIR}/lua/compiled
	cp -p src/ossec-logcollector ${DIR}/bin/
	cp -p src/ossec-syscheckd ${DIR}/bin/
	cp -p src/ossec-execd ${DIR}/bin/
	cp -p src/manage_agents ${DIR}/bin/
	cp -p src/external/lua/src/ossec-lua ${DIR}/bin/
	cp -p src/external/lua/src/ossec-luac ${DIR}/bin/
	cp -p contrib/util.sh ${DIR}/bin/
	cp -p src/init/ossec-local.sh ${DIR}/bin/ossec-control

	mkdir -p ${DIR}/queue
	mkdir -p ${DIR}/queue/alerts
	mkdir -p ${DIR}/queue/ossec
	mkdir -p ${DIR}/queue/syscheck
	mkdir -p ${DIR}/queue/diff

	mkdir -p ${DIR}/etc
	cp -pL /etc/localtime ${DIR}/etc/ 2>/dev/null || /bin/true

	mkdir -p ${DIR}/tmp

	cp -p /etc/TIMEZONE ${DIR}/etc/ 2>/dev/null || /bin/true
	cp -p etc/internal_options.conf ${DIR}/etc/
	cp -p etc/local_internal_options.conf ${DIR}/etc/ > /dev/null 2>&1 || /bin/true
	cp -p etc/client.keys ${DIR}/etc/ > /dev/null 2>&1 ||/bin/true
	cp -p scripts/ossec-local.conf ${DIR}/etc/ossec.conf

	mkdir -p ${DIR}/etc/shared
	cp -p scripts/ossec-local.conf ${DIR}/etc/ossec.conf
	cp -p src/rootcheck/db/*.txt ${DIR}/etc/shared/

	mkdir -p ${DIR}/active-response
	mkdir -p ${DIR}/active-response/bin
	mkdir -p ${DIR}/agentless
	cp -pr src/agentlessd/scripts/* ${DIR}/agentless/

	mkdir -p ${DIR}/.ssh

	cp -p active-response/*.sh ${DIR}/active-response/bin/
	cp -p active-response/firewalls/*.sh ${DIR}/active-response/bin/

	mkdir -p ${DIR}/var
	mkdir -p ${DIR}/var/run

	# Adaptation of the install-server-generic target in src/Makefile
	touch ${DIR}/logs/active-responses.log
	mkdir -p ${DIR}/logs/archives
	mkdir -p ${DIR}/logs/alerts
	mkdir -p ${DIR}/logs/firewall

	cp -p src/ossec-agentlessd ${DIR}/bin/
	cp -p src/ossec-analysisd ${DIR}/bin/
	cp -p src/ossec-monitord ${DIR}/bin/
	cp -p src/ossec-reportd ${DIR}/bin/
	cp -p src/ossec-maild ${DIR}/bin/
	cp -p src/ossec-remoted ${DIR}/bin/
	cp -p src/ossec-logtest ${DIR}/bin/
	cp -p src/ossec-csyslogd ${DIR}/bin/
	cp -p src/ossec-authd ${DIR}/bin/
	cp -p src/ossec-dbd ${DIR}/bin/
	cp -p src/ossec-makelists ${DIR}/bin/
	cp -p src/verify-agent-conf ${DIR}/bin/
	cp -p src/clear_stats ${DIR}/bin/
	cp -p src/list_agents ${DIR}/bin/
	cp -p src/ossec-regex ${DIR}/bin/
	cp -p src/syscheck_update ${DIR}/bin/
	cp -p src/agent_control ${DIR}/bin/
	cp -p src/syscheck_control ${DIR}/bin/
	cp -p src/rootcheck_control ${DIR}/bin/

	mkdir -p ${DIR}/stats
	mkdir -p ${DIR}/rules
	cp -p etc/rules/*.xml ${DIR}/rules/

	mkdir -p ${DIR}/queue/fts

	mkdir -p ${DIR}/queue/rootcheck

	mkdir -p ${DIR}/queue/agent-info
	mkdir -p ${DIR}/queue/agentless

	mkdir -p ${DIR}/queue/rids

	cp -pr etc/decoder.xml ${DIR}/etc/

	# Additional files
	mkdir -p ${DIR}/system
	cp -p scripts/ossec-hids-local.conf ${DIR}/system/ossec-hids-local.conf
	cp -p scripts/ossec-hids-local.service ${DIR}/system/ossec-hids-local.service

	mkdir -p ${DIR}/etc
	echo "DIRECTORY=\"/opt/obsrvbl-ossec\"" > ${DIR}/etc/ossec-init.conf
	echo "VERSION=\"v${VERSION}\"" >> ${DIR}/etc/ossec-init.conf
	echo "DATE=\"`date`\"" >> ${DIR}/etc/ossec-init.conf
	echo "TYPE=\"local\"" >> ${DIR}/etc/ossec-init.conf
