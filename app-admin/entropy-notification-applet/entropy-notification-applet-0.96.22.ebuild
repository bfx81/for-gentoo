# Copyright 2004-2008 Sabayon Linux
# Distributed under the terms of the GNU General Public License v2

EAPI=2
EGIT_TREE="${PV}"
EGIT_REPO_URI="git://sabayon.org/projects/entropy.git"
inherit eutils fdo-mime python git

DESCRIPTION="Entropy's Updates Notification Applet (GTK)"
HOMEPAGE="http://www.sabayonlinux.org"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	=app-admin/sulfur-${PV}
	dev-python/notify-python
	>=sys-apps/dbus-1.2.6
	dev-python/dbus-python
	x11-misc/xdg-utils
	sys-apps/entropy-client-services
"

src_compile() {
	emake -j1 || die "make failed"
}

src_install() {
	emake DESTDIR="${D}" LIBDIR="usr/$(get_libdir)" -j1 notification-applet-install || die "make install failed"
}

pkg_postinst() {
	fdo-mime_mime_database_update
	fdo-mime_desktop_database_update
	python_mod_compile "/usr/$(get_libdir)/entropy/sulfur/applet"
}

pkg_postrm() {
        python_mod_cleanup "/usr/$(get_libdir)/entropy/sulfur/applet"
}
