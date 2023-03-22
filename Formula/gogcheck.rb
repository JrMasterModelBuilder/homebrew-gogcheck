class Gogcheck < Formula
  desc "Bash script that verifies your GOG offline installers' authenticity and checksums"
  homepage "https://github.com/hippie68/gogcheck"
  url "https://github.com/JrMasterModelBuilder/homebrew-gogcheck/releases/download/sources/gogcheck-2022-12-14-2496620693bc8edc437774a56ec54150684978fc.zip"
  version "2022-12-14"
  sha256 "487890f019ce87580708036eed435cdea049e021a2b99d349a09893d5b89542a"

  depends_on "bash"
  depends_on "ca-certificates"
  depends_on "grep"

  def install
    inreplace "gogcheck",
      "#!/bin/bash",
      "#!/usr/bin/env bash"
    inreplace "gogcheck",
      "grep",
      "ggrep"
    inreplace "gogcheck",
      "certfile=/etc/ssl/certs/ca-certificates.crt",
      "certfile='#{HOMEBREW_PREFIX}/share/ca-certificates/cacert.pem'"
    bin.install "gogcheck"
  end

  test do
    system "#{bin}/gogcheck", "-h"
    exe = "#{testpath}/setup_test.exe"
    touch "#{exe}"
    output = shell_output("#{bin}/gogcheck #{testpath}/setup_test.exe 2>&1", 1)
    assert_match "Running signature check...", output
    assert_match "Running binary check...", output
    assert_match "Running innoextract check...", output
    assert_match "[1] #{exe} (digital signature error)", output
    assert_match "[1] #{exe} (not a GOG installer?)", output
    assert_match "[1] #{exe} (innoextract file probing)", output
  end
end
