#!/usr/bin/env bash
set -o errexit
set -o nounset
set -o pipefail

source='https://raw.githubusercontent.com/hippie68/gogcheck/master/gogcheck'
expected='a9097af7d36a9301d63bbd9394067471b76c37f4da07eab19d1663b5c7d70564'

sha256="$(curl -f -L -s "${source}" | shasum -a 256 -b | cut -d' ' -f1)"
if [[ "${sha256}" == "${expected}" ]]; then
	echo "Verified sha256"
else
	echo "Unexpect sha256: ${sha256}"
	exit 1
fi
