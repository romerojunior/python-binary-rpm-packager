APP_NAME=example
VERSION=0.0.1
SUMMARY=Example
VENDOR=Schuberg Philis
MAINTAINER=rgaliza@schubergphilis.com
BUCKET=patchingui-yum-repo

.PHONY: compile
compile:
	pyinstaller example/example.py --onefile

.PHONY: placement
placement: compile
	mkdir -p /opt/example && cp dist/example /opt/example/

.PHONY: package
package: placement
	fpm --name "$(APP_NAME)" --version "$(VERSION)" --rpm-summary "$(SUMMARY)" --vendor "$(VENDOR)" --maintainer "$(MAINTAINER)" --input-type dir --output-type rpm --post-install "scripts/post-install.sh" --post-uninstall "scripts/post-uninstall.sh" /opt/example

.PHONY: repository
repository: package
	mkdir /repo && mv $(APP_NAME)-$(VERSION)-1.x86_64.rpm /repo && createrepo /repo

.PHONY: publish
publish: repository
	aws s3 sync /repo s3://$(BUCKET)
