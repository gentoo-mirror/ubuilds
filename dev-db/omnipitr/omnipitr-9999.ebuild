# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"
inherit eutils git-2

DESCRIPTION="OmniPITR is a set of scripts to ease setting up WAL replication,
and making hot backups from both Master and Slave systems."

HOMEPAGE="https://github.com/omniti-labs/omnipitr"
EGIT_REPO_URI="https://github.com/uu/omnipitr"

LICENSE="AS IS"

SLOT="0"
KEYWORDS="amd64 x86"
IUSE="doc check bzip2 gzip lzma lz4 xz"
DEPEND="
	bzip2? ( app-arch/bzip2 )
	gzip? ( app-arch/gzip )
	lzma? ( app-arch/lzma )
	lz4? ( app-arch/lz4 )
	xz? ( app-arch/xz-utils )
"
RDEPEND="${DEPEND}"

src_install() {
	exeinto /usr/bin
	doexe ${S}/bin/omnipitr-*
	insinto /usr/lib
    doins -r ${S}/lib/*
	dodir /var/tmp/${PN}
	doins ${FILESDIR}/omnipitr-wrapper
}

