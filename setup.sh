#!/bin/sh

#A server setup script (alpha)
server_num=1

#abort script on first error
set -e
set -u

is_running() {
pidof "$1" > /dev/null || return $?
}
is_installed() {
which "$1" > /dev/null || return $?
}

if ! is_installed "lighttpd"; then
echo "(I) Install lighttpd"
apt-get install lighttpd

if ! id www-data 2> /dev/null; then
echo "(I) Create user/group www-data for lighttpd."
useradd --system --no-create-home --user-group --shell /bin/false www-data
