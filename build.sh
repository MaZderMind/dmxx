#!/bin/sh
PROGRAM=${1:-prod}
BOARD="arduino:avr:mega"

arduino --verify --board "${BOARD}" ${PROGRAM}/${PROGRAM}.ino
