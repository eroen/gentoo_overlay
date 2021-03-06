# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils cmake-utils git-2

DESCRIPTION="A PSP emulator for Android, Windows, Mac, Linux and Blackberry 10, written in C++."
HOMEPAGE="http://www.ppsspp.org/"
EGIT_REPO_URI="git://github.com/hrydgard/ppsspp.git"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=""
DEPEND="media-libs/libsdl
	dev-util/cmake
	sys-libs/zlib"

src_prepare() {
	git submodule update --init
}

src_configure() {
	cmake-utils_src_configure
}

src_install() {
	into /usr/games
	dobin "${FILESDIR}"/ppssppsdl
	exeinto /usr/share/games/"${PN}"
	doexe "${WORKDIR}"/"${P}"_build/PPSSPPSDL
	insinto /usr/share/games/"${PN}"
	doins -r "${WORKDIR}"/"${P}"_build/assets
	doins -r "${WORKDIR}"/"${P}"/lang
}
