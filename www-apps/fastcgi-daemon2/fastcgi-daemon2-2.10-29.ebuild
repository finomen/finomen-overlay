EAPI="6"

inherit autotools

SRC_URI="https://github.com/finomen/Fastcgi-Daemon/archive/${P}.zip"
DESCRIPTION="Yandex's opensource framework for highload FastCGI applications on C++ design"
HOMEPAGE="https://github.com/lmovsesjan/Fastcgi-Daemon"
LICENSE="GPL-2"

SLOT="2"

KEYWORDS="~amd64"

CDEPEND="
"

pkg_setup() {
  ebegin "pkg_setup"
  eend $?
}

src_prepare() {
  ebegin "src_prepare"
  eend $?
}

src_configure() {
  ./configure \
        --prefix="${EPREFIX}"/usr \
        --conf-path="${EPREFIX}"/etc/${PN}/${PN}.conf \
        || die "configure failed" 
  
}

src_compile() {
  emake LINK="${CC} ${LDFLAGS}" OTHERLDFLAGS="${LDFLAGS}"
}

src_install() {
    emake DESTDIR="${D%/}" install
}

pkg_postinst() {

}


