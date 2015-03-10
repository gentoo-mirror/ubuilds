# Distributed under the terms of the GNU General Public License v2

EAPI=5

#VIM_PLUGIN_VIM_VERSION="7.0"
inherit vim-plugin

DESCRIPTION="vim plugin: Vim bundle, a vim plugin manager"
HOMEPAGE="http://github.com/gmarik/vundle"
#SRC_URI="https://github.com/gmarik/vundle/archive/${PV}.tar.gz -> ${P}.tar.gz"
SRC_URI="https://github.com/gmarik/Vundle.vim/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
KEYWORDS="amd64 x86"
IUSE=""

S="${WORKDIR}/Vundle.vim-${PV}"

RDEPEND="${RDEPEND}
dev-vcs/git"

VIM_PLUGIN_HELPFILES="vundle.txt"
VIM_PLUGIN_HELPTEXT=""
VIM_PLUGIN_HELPURI=""
VIM_PLUGIN_MESSAGES=""

