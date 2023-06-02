#!/usr/bin/env bash
set -o errexit
set -o nounset
set -o pipefail

source='https://raw.githubusercontent.com/hippie68/gogcheck/master/gogcheck'
expected='0e5a4d2d10e65989d92f8742627ead67de5345762ec002aa44d727aabf54db9c'

sha256="$(curl -f -L -s "${source}" | shasum -a 256 -b | cut -d' ' -f1)"
if [[ "${sha256}" == "${expected}" ]]; then
	echo "Verified sha256"
else
	echo "Unexpect sha256: ${sha256}"
	exit 1
fi
