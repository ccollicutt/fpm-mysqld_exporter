VERSION = 0.10.0
ITERATION = 1
DEB_NAME = mysqld-exporter_${VERSION}-${ITERATION}_amd64.deb
DIR = mysqld_exporter-${VERSION}.linux-amd64
EMAIL = curtis@serverascode.com

deb:
	-rm ${DEB_NAME}
	fpm -s dir -t deb -n mysqld_exporter \
	--description "A mysqld exporter for prometheus" \
	-m ${EMAIL} \
    --before-install pre-install.sh \
    --post-install post-install.sh \
	-v ${VERSION} \
	--iteration ${ITERATION} \
	${DIR}/mysqld_exporter=/usr/sbin/mysqld_exporter \
	mysqld-exporter.default=/etc/default/mysqld-exporter \
	my.cnf=/etc/mysqld-exporter/my.cnf \
	mysqld_exporter.service=/etc/systemd/system/multi-user.target.wants/mysqld_exporter.service 

