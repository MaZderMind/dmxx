#!/bin/sh
PROGRAM=${1:-dmxx}
BOARD="arduino:avr:mega"

arduino --upload --board "${BOARD}" ${PROGRAM}/${PROGRAM}.ino
