#!/usr/bin/env bash
# shellcheck disable=SC1091
set -xeo pipefail

[ -n "$CI" ]

install() {
    sudo DEBIAN_FRONTEND=noninteractive apt \
        -o Dpkg::Options::=--force-confold \
        install -y --no-install-recommends \
        bind9-utils
}
install || { sudo apt update -qq; install; }

check() {
    PATH=/sbin:/usr/sbin:$PATH named-checkzone -i local -l 86400 $@
}

pushd generated/dns

check 'ster'                      buzzster
check '54.10.in-addr.arpa'      db.10.54
check '4.5.d.c.1.d.f.ip6.arpa' db.fd10.cd54

popd
