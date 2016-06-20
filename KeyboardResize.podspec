Pod::Spec.new do |s|
  s.name              = 'KeyboardResize'
  s.version           = '2.0.0'
  s.license           = 'MIT'
  s.summary           = 'Automatically resize the view of your controllers when the keyboard appears'
  s.homepage          = 'https://github.com/KogiMobileSAS/KeyboardResize'
  s.social_media_url  = 'https://twitter.com/kogimobile'
  s.author            = "Kogi Mobile"
  s.source            = { :git => 'https://github.com/KogiMobileSAS/KeyboardResize.git', :tag => s.version }

  s.platform          = :ios, "8.0"

  s.source_files      = 'Source/*.swift'
end