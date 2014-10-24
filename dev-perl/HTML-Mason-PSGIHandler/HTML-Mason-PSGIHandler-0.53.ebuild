# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $
EAPI=5
inherit perl-module

DESCRIPTION="PSGI handler for HTML::Mason"
SRC_URI="mirror://cpan/authors/id/R/RU/RUZ/${P}.tar.gz"
HOMEPAGE="http://search.cpan.org/~ruz/${P}/"

SLOT="0"
LICENSE="|| ( Artistic GPL-2 )"
KEYWORDS="alpha amd64 ia64 ppc ppc64 sparc x86"
IUSE=""

SRC_TEST="do"
#DEPEND="dev-perl/Convert-Color-Library
#dev-perl/List-UtilsBy"

export OPTIMIZE="$CFLAGS"
