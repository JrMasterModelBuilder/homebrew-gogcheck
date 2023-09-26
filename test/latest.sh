#!/usr/bin/env bash
set -o errexit
set -o nounset
set -o pipefail

source='https://raw.githubusercontent.com/hippie68/gogcheck/master/gogcheck'
expected='04183fe0e3813b07625aa9804276e5ce6a02ff80bea0116f1b96f9c3f1c3fb47'

sha256="$(curl -f -L -s "${source}" | shasum -a 256 -b | cut -d' ' -f1)"
if [[ "${sha256}" == "${expected}" ]]; then
	echo "Verified sha256"
else
	echo "Unexpect sha256: ${sha256}"
	exit 1
fi
