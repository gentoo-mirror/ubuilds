# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

JAVA_PKG_IUSE="doc source"

inherit eutils java-pkg-2 java-ant-2

DESCRIPTION="Simple Logging Facade for Java"
HOMEPAGE="http://www.slf4j.org/"
SRC_URI="http://dev.gentooexperimental.org/~dreeevil/${P}-sources.jar"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

CDEPEND="dev-java/slf4j-api dev-java/log4j"
RDEPEND=">=virtual/jre-1.4 ${CDEPEND}"
DEPEND=">=virtual/jdk-1.4 ${CDEPEND}"

src_unpack() {
	unpack ${A}
	cp -v "${FILESDIR}"/build.xml . || die "Importing build.xml failed"
	java-pkg_jar-from slf4j-api || die "Failed jar-from [slf4j-api]"
	java-pkg_jar-from log4j || die "Failed jar-from [log4j]"
}

src_install() {
	java-pkg_dojar ${PN}.jar
	use doc && java-pkg_dojavadoc docs
	use source && java-pkg_dosrc org
}
