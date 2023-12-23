# Homebrew gogcheck

Homebrew tap for gogcheck

[![Build Status](https://github.com/JrMasterModelBuilder/homebrew-gogcheck/workflows/macOS%2013/badge.svg?branch=main)](https://github.com/JrMasterModelBuilder/homebrew-gogcheck/actions?query=workflow%3AmacOS%2013+branch%3Amain)

[![Build Status](https://github.com/JrMasterModelBuilder/homebrew-gogcheck/workflows/macOS%2012/badge.svg?branch=main)](https://github.com/JrMasterModelBuilder/homebrew-gogcheck/actions?query=workflow%3AmacOS%2012+branch%3Amain)

[![Build Status](https://github.com/JrMasterModelBuilder/homebrew-gogcheck/workflows/Ubuntu%2022.04/badge.svg?branch=main)](https://github.com/JrMasterModelBuilder/homebrew-gogcheck/actions?query=workflow%3AUbuntu%2022.04+branch%3Amain)

[![Build Status](https://github.com/JrMasterModelBuilder/homebrew-gogcheck/workflows/Ubuntu%2020.04/badge.svg?branch=main)](https://github.com/JrMasterModelBuilder/homebrew-gogcheck/actions?query=workflow%3AUbuntu%2020.04+branch%3Amain)


# Usage

## Tap

```
$ brew tap JrMasterModelBuilder/gogcheck
```

## Install

```
$ brew install gogcheck
```

## Dependencies

To support all the check methods, also install:

-   `md5sum`: `brew install coreutils` or `brew install md5sha1sum`
-   `osslsigncode`: `brew install osslsigncode`
-   `innoextract`: `brew install innoextract`
-   `unrar` or `unar`:
    -   `unrar` macOS: `brew install --cask rar`
    -   `unrar` Debian: `apt-get install unrar`
    -   `unar`: `brew install unar`
