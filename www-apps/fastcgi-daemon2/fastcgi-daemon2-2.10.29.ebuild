EAPI="6"

inherit autotools git-r3

EGIT_REPO_URI="https://github.com/finomen/Fastcgi-Daemon.git"
EGIT_COMMIT="${PV}"
DESCRIPTION="Yandex's opensource framework for highload FastCGI applications on C++ design"
HOMEPAGE="https://github.com/lmovsesjan/Fastcgi-Daemon"
LICENSE="GPL-2"

SLOT="2"

KEYWORDS="~amd64"

DEPEND="
  dev-libs/fcgi
"

pkg_setup() {
  ebegin "pkg_setup"
  eend $?
}

src_prepare() {
  ebegin "src_prepare"
  eautoreconf
  eapply_user
  eend $?
}

src_configure() {
  ./configure \
        --prefix="${EPREFIX}"/usr \
        --sysconfdir="${EPREFIX}"/etc/${PN}/${PN}.conf \
        || die "configure failed" 
  
}

src_compile() {
  emake LINK="${CC} ${LDFLAGS}" OTHERLDFLAGS="${LDFLAGS}"
}

src_install() {
    emake DESTDIR="${D%/}" install
}

pkg_postinst() {
  ebegin "Postinst"
  eend $?
}


