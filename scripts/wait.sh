#!/bin/sh
until [ -f /var/lib/cloud/instance/boot-finished ]
do
  sleep 1
done;
