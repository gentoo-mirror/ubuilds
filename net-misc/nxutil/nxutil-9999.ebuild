# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=6

PYTHON_COMPAT=( python{2_7,3_3,3_4,3_7,3_8,3_9,3_10} )

PATCHES=( "${FILESDIR}"/gentoo-path.patch )

inherit distutils-r1 git-r3

DESCRIPTION="naxsi whitelist creation"
HOMEPAGE="https://github.com/prajal/nxutil"
EGIT_REPO_URI="https://github.com/prajal/nxutil.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

RDEPEND=""
DEPEND="${RDEPEND}
	dev-python/setuptools"


#S="${WORKDIR}/${P}"
#distutils_src_prepare(){
#distutils_src_prepare
#	epatch ${FILESDIR}/gentoo-path.patch
#}
