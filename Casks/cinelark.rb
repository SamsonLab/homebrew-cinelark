cask "cinelark" do
  version "0.1.7"
  sha256 "3548fbd2a5c1e8e039c0d28e1ad37014e9b80f2da7b43110c3abb3016355d08a"

  url "https://github.com/SamsonLab/cinelark/releases/download/v#{version}/CineLark_#{version}_universal.dmg"
  name "CineLark"
  desc "TV-first media library client using IINA for playback"
  homepage "https://github.com/SamsonLab/cinelark"

  depends_on macos: :tahoe

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

  caveats <<~EOS
    CineLark requires IINA for playback. If IINA is not already installed:
      brew install --cask iina
  EOS
end
