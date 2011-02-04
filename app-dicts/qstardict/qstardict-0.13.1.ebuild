# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit eutils qt4
DESCRIPTION="QStarDict is a StarDict clone written with using Qt"
HOMEPAGE="http://qstardict.ylsoftware.com/"
SRC_URI="http://qstardict.ylsoftware.com/files/${P}.tar.bz2"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~ia64"
IUSE="dbus nls"
RDEPEND="x11-libs/qt-core
	x11-libs/qt-gui
	dbus? ( x11-libs/qt-gui[dbus] )
	>=dev-libs/glib-2.0"
DEPEND="${RDEPEND}"
PROVIDE="virtual/stardict"

src_configure() {
	QMAKE_FLAGS=""
	if ! use dbus; then
		QMAKE_FLAGS+="NO_DBUS=1 "
	fi
	if ! use nls; then
		QMAKE_FLAGS+="NO_TRANSLATIONS=1 "
	fi
	eqmake4 $QMAKE_FLAGS || die "qmake failed"
}

src_install() {
	emake INSTALL_ROOT="${D}" install || die "emake install filed"
}

