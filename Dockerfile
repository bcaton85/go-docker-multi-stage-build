FROM registry.access.redhat.com/ubi9-beta/ubi
RUN dnf install https://dl.fedoraproject.org/pub/epel/epel-release-latest-9.noarch.rpm && dnf -y update
