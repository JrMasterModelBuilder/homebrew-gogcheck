class Gogcheck < Formula
  desc "Bash script that verifies your GOG offline installers' authenticity and checksums"
  homepage "https://github.com/hippie68/gogcheck"
  url "https://github.com/JrMasterModelBuilder/homebrew-gogcheck/releases/download/sources/gogcheck-2023-09-22-81c92ca9716e88a91f89982927d567852c21d84a.zip"
  version "2023-09-22"
  sha256 "7e5b5dba827652ad28b21ee9b7cf81237ed52b495f6c1eb4164e3e79baf0b0f7"

  on_macos do
    depends_on "bash"
    depends_on "grep"
  end

  def install
    inreplace "gogcheck",
      "#!/bin/bash",
      "#!/usr/bin/env bash"
    if OS.mac?
      inreplace "gogcheck",
        "grep",
        "ggrep"
    end
    inreplace "gogcheck",
      "Download the latest version from https://github.com/mtrojnar/osslsigncode.",
      "Install dependency to use this check."
    inreplace "gogcheck",
      "Download the latest version from https://constexpr.org/innoextract.",
      "Install dependency to use this check."
    inreplace "gogcheck",
      "Download the latest UnRAR version from https://www.rarlab.com/rar_add.htm.",
      "Install dependency to use this check."
    bin.install "gogcheck"
  end

  test do
    system "#{bin}/gogcheck", "-h"
    touch "#{testpath}/setup_test.exe"
    output = shell_output("#{bin}/gogcheck #{testpath}/setup_test.exe 2>&1", 1)
    assert_match "Running signature check...", output
    assert_match "Unrecognized file type - file is too short: #{testpath}/setup_test.exe", output
    assert_match "Failed", output
    assert_match "Running binary check...", output
    assert_match "No .bin file checksums found.", output
    assert_match "No matching .bin files found either.", output
    assert_match "Is this .exe a GOG installer?", output
    assert_match "Running innoextract check...", output
    assert_match "Not a supported Inno Setup installer!", output
    assert_match "innoextract reported errors while probing the file.", output
    assert_match "Files that produced errors:", output
    assert_match "[1] #{testpath}/setup_test.exe (digital signature error)", output
    assert_match "[1] #{testpath}/setup_test.exe (not a GOG installer?)", output
    assert_match "[1] #{testpath}/setup_test.exe (innoextract file probing)", output
  end
end
