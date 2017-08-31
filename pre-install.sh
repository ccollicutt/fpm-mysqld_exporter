#!/bin/sh

adduser \
  --system \
  --home /var/run/mysqld-exporter \
  --shell /bin/false \
  --group mysqlexp

