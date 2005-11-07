install_ = "install"
name = "grml-vpn"

etc = ${DESTDIR}/etc/
usr = ${DESTDIR}/usr
usrbin = $(usr)/bin
usrsbin = $(usr)/sbin
usrshare = $(usr)/share/$(name)
usrdoc = $(usr)/share/doc/$(name)
man8 = $(usr)/share/man/man8/

#%.html : %.txt ;
#	asciidoc -b xhtml11 $*.txt

all: doc

doc: doc_man doc_html

doc_html: html-stamp

html-stamp:
	asciidoc -b xhtml11 grml-vpn.8.txt
	touch html-stamp

doc_man: man-stamp

man-stamp:
	asciidoc -d manpage -b docbook grml-vpn.8.txt
	sed -i 's/<emphasis role="strong">/<emphasis role="bold">/' grml-vpn.8.xml
	xsltproc /usr/share/xml/docbook/stylesheet/nwalsh/manpages/docbook.xsl grml-vpn.8.xml
	gzip --best grml-vpn.8
	touch man-stamp

	
install: all
	$(install_) -d -m 755 $(usrdoc)
	$(install_) -m 644 TODO $(usrdoc)
	$(install_) -m 644 grml-vpn.8.html $(usrdoc)

	$(install_) -d -m 755 $(man8)
	$(install_) -m 644 grml-vpn.8.gz $(man8)

	$(install_) -m 755 -d $(usrsbin)
	$(install_) -m 755 grml-vpn $(usrsbin)

clean:
	rm -rf grml-vpn.8.html grml-vpn.8.xml grml-vpn.8 grml-vpn.8.gz html-stamp man-stamp

