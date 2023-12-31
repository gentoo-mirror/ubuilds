# Copyright 1999-2018 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit systemd user

DESCRIPTION="Exports Prometheus metrics for SSL certificates"
HOMEPAGE="https://github.com/ribbybibby/ssl_exporter"
SRC_URI="https://github.com/ribbybibby/ssl_exporter/releases/download/v${PV}/${PN}_${PV}_linux_amd64.tar.gz -> ${P}.tar.gz"
RESTRICT="mirror"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DOCS=( README.md )
QA_PRESTRIPPED="usr/bin/ssl_exporter"

#G="${WORKDIR}/${P}"
S="${WORKDIR}"

pkg_pretend() {
	if [[ "${MERGE_TYPE}" != binary ]]; then
		# shellcheck disable=SC2086
		(has test ${FEATURES} && has network-sandbox ${FEATURES}) && \
			die "The test phase requires 'network-sandbox' to be disabled in FEATURES"
	fi
}

pkg_setup() {
	enewgroup ssl_exporter
	enewuser ssl_exporter -1 -1 -1 ssl_exporter
}

src_install() {
	dobin ssl_exporter
	einstalldocs

	newinitd "${FILESDIR}/${PN}.initd" "${PN}"
	newconfd "${FILESDIR}/${PN}.confd" "${PN}"
	systemd_dounit "${FILESDIR}/${PN}.service"

	diropts -m 0750 -o ssl_exporter -g ssl_exporter
	keepdir /var/log/ssl_exporter
}
