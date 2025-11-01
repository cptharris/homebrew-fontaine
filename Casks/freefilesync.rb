cask "freefilesync" do
  version "14.5"
  sha256 "99b531404a083b25bf323750c5e376fca9aae7af491a2872e3b11d3789f5b273"

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
