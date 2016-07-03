PREFIX = /opt/obsrvbl-ossec
TARGET = local
VERSION = 2.9rc2
BUILD_DIR = ossec-hids-${TARGET}
TARGET_ROOT = ${BUILD_DIR}/target_root

build:
	cp -r ossec-hids/src/ ${BUILD_DIR}/
	cp -r ossec-hids/etc/ ${BUILD_DIR}/
	cp -r ossec-hids/contrib/ ${BUILD_DIR}/
	cp -r ossec-hids/active-response/ ${BUILD_DIR}/
	make -C ${BUILD_DIR} all
	make -C ${BUILD_DIR} install VERSION=${VERSION}

deb:
	mkdir -p packages/
	fpm \
		-s dir \
		-t deb \
		-n obsrvbl-ossec \
		-v ${VERSION} \
		-p packages/${BUILD_DIR}.deb \
		--force \
		--category 'admin' \
		--license 'GNU General Public License (version 2)' \
		--conflicts 'ossec-hids-server' \
		--conflicts 'ossec-hids-agent' \
		--deb-recommends 'ona-service' \
		--deb-compression bzip2 \
		--after-install ${BUILD_DIR}/scripts/ossec-hids-local.postinst \
		--after-remove ${BUILD_DIR}/scripts/ossec-hids-local.postrm \
		--url 'https://github.com/obsrvbl/obsrvbl-ossec/' \
		--description 'OSSEC package for use with Observable Networks monitoring' \
		-m "Observable Networks, Inc. <engineering@observable.net>" \
		-a 'amd64' \
		--deb-no-default-config-files \
		${BUILD_DIR}/target_root/=/

rpm:
	mkdir -p packages/
	fpm \
		-s dir \
		-t rpm \
		-n obsrvbl-ossec \
		-v ${VERSION} \
		-p packages/${BUILD_DIR}.rpm \
		--force \
		--category 'admin' \
		--license 'GNU General Public License (version 2)' \
		--conflicts 'ossec-hids-server' \
		--conflicts 'ossec-hids-agent' \
		--rpm-compression bzip2 \
		--after-install ${BUILD_DIR}/scripts/ossec-hids-local.postinst \
		--after-remove ${BUILD_DIR}/scripts/ossec-hids-local.postrm \
		--url 'https://github.com/obsrvbl/obsrvbl-ossec/' \
		--description 'OSSEC package for use with Observable Networks monitoring' \
		-m "Observable Networks, Inc. <engineering@observable.net>" \
		-a 'x86_64' \
		--config-files /opt/obsrvbl-ossec/etc/ossec.conf \
		--config-files /opt/obsrvbl-ossec/rules/local_rules.xml \
		${BUILD_DIR}/target_root/=/
