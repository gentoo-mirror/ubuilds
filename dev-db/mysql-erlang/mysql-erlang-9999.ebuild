# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit multilib

DESCRIPTION="Native MySQL driver fo erlang"
HOMEPAGE="http://process-one.net"
SRC_URI=""

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64 -*"
IUSE=""

DEPEND="dev-lang/erlang"
RDEPEND="${DEPEND}"
S=${WORKDIR}/mysql

src_unpack() {
	cp -r ${FILESDIR} ${WORKDIR}
}

src_compile() {
	find -name "*.erl" -exec erlc {} \;
}

src_install() {
	local ERL_LIBDIR=/usr/$(get_libdir)/erlang/lib
	
	dodir ${ERL_LIBDIR}/ebin
	insinto ${ERL_LIBDIR}/ebin
	doins *.beam

	dodir ${ERL_LIBDIR}/src
	insinto ${ERL_LIBDIR}/src
	doins ${FILESDIR}/*.erl
}

