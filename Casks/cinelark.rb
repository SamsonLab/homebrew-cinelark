cask "cinelark" do
  version "0.1.2"
  sha256 "1ea6507307ef9a0e21125c1d7834cc9b608b3fbb59156ca5da14cfc9cea64f67"

  url "https://github.com/SamsonLab/cinelark/releases/download/v#{version}/CineLark_#{version}_universal.dmg"
  name "CineLark"
  desc "TV-first media library client using IINA for playback"
  homepage "https://github.com/SamsonLab/cinelark"

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

  caveats <<~EOS
    CineLark requires IINA for playback. If IINA is not already installed:
      brew install --cask iina
  EOS
end
