# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-analyzer/nagios-check_fail2ban/nagios-check_fail2ban-3.ebuild,v 1.2 2011/05/14 06:28:43 hollow Exp $

EAPI="7"

inherit multilib autotools

GITHUB_AUTHOR="hollow"
GITHUB_PROJECT="check_fail2ban"
GITHUB_COMMIT="c554837"

DESCRIPTION="A nagios plugin for checking the fail2ban daemon"
HOMEPAGE="https://github.com/hollow/check_fail2ban"
SRC_URI="http://nodeload.github.com/${GITHUB_AUTHOR}/${GITHUB_PROJECT}/tarball/v${PV} -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

S="${WORKDIR}"/${GITHUB_AUTHOR}-${GITHUB_PROJECT}-${GITHUB_COMMIT}

src_prepare() {
	eautoreconf
	default
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
}
