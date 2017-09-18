Pod::Spec.new do |s|
  s.name = "FlipLabel"
  s.version = "1.0.1"
  s.summary = "Flip animation for UILabel"
  s.homepage = "https://github.com/beryu/FlipLabel"
  s.screenshots = "https://github.com/beryu/FlipLabel/raw/master/assets/screenshot1.gif"
  s.license = { :type => "MIT", :file => "LICENSE" }
  s.author = { "Ryuta Kibe" => "beryu@blk.jp" }
  s.social_media_url   = "http://twitter.com/beryu"
  s.platform = :ios
  s.ios.deployment_target = "8.0"
  s.source = { :git => "https://github.com/beryu/FlipLabel.git", :tag => s.version }
  s.source_files = "Source/*"
  s.requires_arc = true
end

