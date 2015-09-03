PREFIX = /opt/obsrvbl/ossec
TARGET = local
VERSION = 2.8.2

copy:
	cp -r ossec-hids/src/ ossec-hids-${TARGET}-${VERSION}/
	cp -r ossec-hids/etc/ ossec-hids-${TARGET}-${VERSION}/
	cp -r ossec-hids/contrib/ ossec-hids-${TARGET}-${VERSION}/
	cp -r ossec-hids/active-response/ ossec-hids-${TARGET}-${VERSION}/

deb:
	( cd ossec-hids-${TARGET}-${VERSION}/ ; debuild -i -uc -us -b )
	mkdir -p debs/
	mv *.deb debs/
