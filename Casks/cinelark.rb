cask "cinelark" do
  version "0.1.9"
  sha256 "c6720dba5ca72c615e43759720a6080f9be898b5dbd07afbc5d2619624b79c06"

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
