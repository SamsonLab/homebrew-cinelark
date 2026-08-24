cask "cinelark" do
  version "0.1.3"
  sha256 "466b87f564c315eedd31e13619f1adf6d8210e8a90fad32271cd5c9f1fb3620d"

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
