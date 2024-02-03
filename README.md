# Homebrew gogcheck

Homebrew tap for gogcheck

![macOS 14](https://github.com/JrMasterModelBuilder/homebrew-gogcheck/workflows/macOS%2014/badge.svg)

![macOS 13](https://github.com/JrMasterModelBuilder/homebrew-gogcheck/workflows/macOS%2013/badge.svg)

![macOS 12](https://github.com/JrMasterModelBuilder/homebrew-gogcheck/workflows/macOS%2012/badge.svg)

![Ubuntu 22.04](https://github.com/JrMasterModelBuilder/homebrew-gogcheck/workflows/Ubuntu%2022.04/badge.svg)

![Ubuntu 20.04](https://github.com/JrMasterModelBuilder/homebrew-gogcheck/workflows/Ubuntu%2020.04/badge.svg)


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
