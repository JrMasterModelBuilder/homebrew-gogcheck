#!/usr/bin/env bash
set -o errexit
set -o nounset
set -o pipefail

source='https://raw.githubusercontent.com/hippie68/gogcheck/master/gogcheck'
expected='f93c74650fdce56d43a13081b2443c30bcb9028475fe1620a67d2bedb4cb26c3'

sha256="$(curl -f -L -s "${source}" | shasum -a 256 -b | cut -d' ' -f1)"
if [[ "${sha256}" == "${expected}" ]]; then
	echo "Verified sha256"
else
	echo "Unexpect sha256: ${sha256}"
	exit 1
fi
