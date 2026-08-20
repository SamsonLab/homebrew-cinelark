cask "cinelark" do
  version "0.1.1"
  sha256 "2ba4d915ef35a32e96d9857d5ea12a023c05f824b41a238953d25e7a0ce47aac"

  url "https://github.com/SamsonLab/cinelark/releases/download/v#{version}/CineLark_#{version}_universal.dmg"
  name "CineLark"
  desc "TV-first media library client using IINA for playback"
  homepage "https://github.com/SamsonLab/cinelark"

  depends_on cask: "iina"
  depends_on macos: :sonoma

  app "CineLark.app"

  postflight_steps do
    run "/usr/bin/xattr",
        args: ["-cr", "{{appdir}}/CineLark.app"]
  end

  zap trash: [
    "~/Library/Application Support/CineLark",
    "~/Library/Caches/com.samsonlab.cinelark",
    "~/Library/Preferences/com.samsonlab.cinelark.plist",
    "~/Library/Saved Application State/com.samsonlab.cinelark.savedState",
  ]
end
