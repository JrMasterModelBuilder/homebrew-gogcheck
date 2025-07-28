#!/usr/bin/env bash
set -o errexit
set -o nounset
set -o pipefail

source='https://raw.githubusercontent.com/hippie68/gogcheck/master/gogcheck'
expected='277966e06172d4a80d5a6735b658220cf6ad90afb88fa589cf03ed163721733c'

sha256="$(curl -f -L -s "${source}" | shasum -a 256 -b | cut -d' ' -f1)"
if [[ "${sha256}" == "${expected}" ]]; then
	echo "Verified sha256"
else
	echo "Unexpect sha256: ${sha256}"
	exit 1
fi
