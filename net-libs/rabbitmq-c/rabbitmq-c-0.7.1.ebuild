# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="5"

inherit cmake-utils eutils multilib

DESCRIPTION="RabbitMQ C client"
HOMEPAGE="https://github.com/alanxz/rabbitmq-c"

if [[ ${PV} == *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/alanxz/rabbitmq-c.git"
else
	SRC_URI="https://github.com/alanxz/rabbitmq-c/archive/v${PV}.zip -> ${PN}-v${PV}.zip"
	KEYWORDS="amd64 ~arm hppa x86"
fi

LICENSE="MIT"
SLOT="0"
IUSE="tools"

DEPEND=""
RDEPEND="${DEPEND}"
DOCS=( "AUTHORS" "README.md" "THANKS" "TODO" )

src_unpack() {
	if [[ ${PV} == *9999* ]]; then
		git-r3_src_unpack
	else
		unpack ${A}
	fi
}

src_configure() {
	mycmakeargs=(
		-DCMAKE_SKIP_RPATH=ON
		$(cmake-utils_use tools BUILD_TOOLS)
		$(cmake-utils_use tools BUILD_TOOLS_DOCS)
	)
	cmake-utils_src_configure
}
