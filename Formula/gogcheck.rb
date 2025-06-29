class Gogcheck < Formula
  desc "Bash script that verifies your GOG offline installers' authenticity and checksums"
  homepage "https://github.com/hippie68/gogcheck"
  url "https://github.com/JrMasterModelBuilder/homebrew-gogcheck/releases/download/sources/gogcheck-2025-04-11-1c3e32ff9c0bdcc758de300eea93b1dba77ae904.zip"
  version "2025-04-11"
  sha256 "f15d9ffb9a6f9bd446c2af683245c0c4ffef184a00227d1cc832f377cb3c6567"
  revision 1

  on_macos do
    depends_on "bash"
    depends_on "grep"
    depends_on "findutils"
  end

  def install
    inreplace "gogcheck" do |s|
      s.gsub! "#!/bin/bash", "#!/usr/bin/env bash"
      s.gsub! "[[ $osslsigncode_output != *'/O=GOG '* ]]", "[[ $osslsigncode_output != *',O=GOG '* && $osslsigncode_output != *'/O=GOG '* ]]"
      if OS.mac?
        s.gsub! /\bgrep\b/, "ggrep"
        s.gsub! /\bfind\b/, "gfind"
      end
      s.gsub! /"Download the latest [^"]*version from [^"]+"/, '"Install dependency to use this check."'
    end
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
