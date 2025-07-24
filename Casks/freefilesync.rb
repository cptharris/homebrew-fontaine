cask "freefilesync" do
  version "14.3"
  sha256 "09675c7886d5347d65f6ebdbe135fffb9851fd6c140781360cf3dc841ad20254"

  url "https://freefilesync.org/download/FreeFileSync_#{version}_macOS.zip"
  name "FreeFileSync"
  desc "Folder comparison and synchronization software"
  homepage "https://freefilesync.org/"

  installer script: {
    executable: "#{staged_path}/FreeFileSync_#{version}.pkg",
    args:       ["--install"],
  }

  uninstall pkgutil: [
    "org.freefilesync.pkg.FreeFileSync",
    "org.freefilesync.pkg.RealTimeSync"
  ],
  delete: [
    "/Applications/FreeFileSync.app",
    "/Applications/RealTimeSync.app",
    "/usr/local/bin/freefilesync",
    "/private/var/folders/8w/rynwtsln12b7g04cjzf34js40000gn/C/org.freefilesync.FreeFileSync"
  ]

  zap trash: [
    "~/Library/Application Support/FreeFileSync",
    "~/Library/Preferences/org.freefilesync.FreeFileSync.plist"
    # "~/Library/Saved Application State/org.freefilesync.FreeFileSync.savedState"
  ]
end