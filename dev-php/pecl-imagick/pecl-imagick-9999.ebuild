# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

PHP_EXT_NAME="imagick"
USE_PHP="php7-3 php7-4 php8-0"
EGIT_REPO_URI="https://github.com/Imagick/imagick.git"
PHP_EXT_PECL_PKG="pecl-imagick"
inherit php-ext-pecl-r3 git-r3
SRC_URI=""

KEYWORDS="amd64 ~arm ~arm64 x86"

DESCRIPTION="PHP wrapper for the ImageMagick library"
HOMEPAGE="https://pecl.php.net/imagick https://github.com/mkoppanen/imagick"
LICENSE="PHP-3.01"
SLOT="0"
IUSE="examples test"
RESTRICT="!test? ( test )"

# imagemagick[-openmp] is needed wrt bug 547922 and upstream
# https://github.com/mkoppanen/imagick#openmp
RDEPEND=">=media-gfx/imagemagick-6.2.4:=[-openmp]"
DEPEND="${RDEPEND}
	test? ( >=media-gfx/imagemagick-6.2.4:=[jpeg,png,svg,truetype,xml] )"

PHP_EXT_ECONF_ARGS="--with-imagick=${EPREFIX}/usr"
