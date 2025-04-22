# Copyright 1999-2018 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/winduptoy"
GOLANG_PKG_ARCHIVEPREFIX="v"
GOLANG_PKG_BUILDPATH="/cmd/${PN}"
GOLANG_PKG_HAVE_TEST=1

inherit golang-vcs systemd user git-r3

DESCRIPTION="A Prometheus metrics exporter for the Beanstalkd"
HOMEPAGE="https://github.com/winduptoy/beanstalkd_exporter"
SRC_URI=""
EGIT_REPO_URI="https://github.com/winduptoy/${PN}.git"
RESTRICT="mirror"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"

QA_PRESTRIPPED="usr/bin/${PN}"

G="${WORKDIR}/${P}"
S="${G}"

pkg_setup() {
	enewgroup ${PN}
	enewuser ${PN} -1 -1 -1 ${PN}
}

src_compile() {
	export GOPATH="${G}"
	local mygoargs=(
		-v -work -x
		"-asmflags=all=-trimpath=${S}"
		"-gcflags=all=-trimpath=${S}"
		-ldflags "-s -w"
	)
	go get
	go build "${mygoargs[@]}" || die
}

src_install() {
	newbin ${P} ${PN}

	newinitd "${FILESDIR}/${PN}.initd" "${PN}"
	newconfd "${FILESDIR}/${PN}.confd" "${PN}"
	systemd_dounit "${FILESDIR}/${PN}.service"
}
