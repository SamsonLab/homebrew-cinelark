cask "cinelark" do
  version "0.1.8"
  sha256 "22690dd3b8995d0c11f0cad9afe37a8c35ea492188d1fdb191309e2c1688beb4"

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
