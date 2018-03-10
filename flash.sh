#!/bin/sh
PROGRAM=${1:-prod}
BOARD="arduino:avr:mega"

arduino --upload --board "${BOARD}" ${PROGRAM}/${PROGRAM}.ino
