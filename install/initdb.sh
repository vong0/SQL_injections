#!/bin/bash
set -e
cd `dirname $0`
dropdb --if-exists unsw
createdb unsw 
psql unsw -f unsw.sql
