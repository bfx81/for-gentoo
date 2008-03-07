# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header:

inherit eutils versionator

DESCRIPTION="Desktop Acceleration Configuration Helpers - Supporting XGL/AIGLX with Beryl"
HOMEPAGE="http://www.sabayonlinux.org/"
SRC_URI=""
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="x86 amd64 ppc"
IUSE=""

src_unpack () {

        cd ${WORKDIR}
        cp ${FILESDIR}/${PV}/*-setup . -p
}

src_install () {

	cd ${WORKDIR}
	exeinto /sbin/
	doexe *-setup

	insinto /etc/
	doins ${FILESDIR}/${PV}/desktop-acceleration-helpers.conf

}

pkg_preinst() {
	ewarn "If you are using an ATI video card:"
	ewarn "Please upgrade your drivers to >=ati-drivers-8.42.3 !!!"
	ewarn "With this package we are dropping XGL support"
	sleep 5
}
