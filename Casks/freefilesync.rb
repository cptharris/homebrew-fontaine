cask "freefilesync" do
  version "14.4"
  sha256 "a18d76ac24aa3bfeb313797b931057308307a60f57e782609279a6bc261e1eb8"

  url "https://freefilesync.org/download/FreeFileSync_#{version}_macOS.zip"
  name "FreeFileSync"
  desc "Folder comparison and synchronization software"
  homepage "https://freefilesync.org/"

  pkg "FreeFileSync_#{version}.pkg"

  uninstall pkgutil: [
              "org.freefilesync.pkg.FreeFileSync",
              "org.freefilesync.pkg.RealTimeSync",
            ],
            delete:  [
              "/Applications/FreeFileSync.app",
              "/Applications/RealTimeSync.app",
              "/private/var/folders/8w/rynwtsln12b7g04cjzf34js40000gn/C/org.freefilesync.FreeFileSync",
              "/usr/local/bin/freefilesync",
            ]

  zap trash: [
    "~/Library/Application Support/FreeFileSync",
    "~/Library/Preferences/org.freefilesync.FreeFileSync.plist",
    # "~/Library/Saved Application State/org.freefilesync.FreeFileSync.savedState"
  ]
end
