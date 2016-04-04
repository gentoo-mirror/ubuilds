# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

DESCRIPTION="NVM-Express user space tooling for Linux"
HOMEPAGE="https://github.com/linux-nvme/nvme-cli"
SRC_URI="https://github.com/linux-nvme/nvme-cli/archive/v${PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
RDEPEND="sys-libs/libcap"
DEPEND="${RDEPEND}"
#S=${WORKDIR}/${PN}-${EGIT_COMMIT}

src_prepare() {
	eapply_user
	sed 's|-m64 \(-std=gnu99\) -O2 -g \(-pthread -D_GNU_SOURCE -D_REENTRANT -Wall\) -Werror|\1 \2|' \
		-i Makefile || die
	sed 's|/usr/local|$(DESTDIR)/$(PREFIX)/share|' \
		-i Documentation/Makefile || die
}

src_install() {
	emake DESTDIR="${D}" PREFIX=/usr install
}
