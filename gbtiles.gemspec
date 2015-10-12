# Ensure we require the local version and not one we might have installed already
require File.join([File.dirname(__FILE__),"lib","gbtiles","version.rb"])
spec = Gem::Specification.new do |s| 
  s.name        = "gbtiles"
  s.version     = GBTiles::VERSION
  s.date        = Time.now.getutc
  s.authors     = ["Bashkim Isai"]
  s.license     = "MIT"
  s.homepage    = "http://github.com/bashaus/gbtiles"
  s.platform    = Gem::Platform::RUBY
  s.summary     = "Converts .GBR and .GBM files to different Game Boy formats"
  s.description = "Allows files created by Harry Mulder's Game Boy Map Builder and Game Boy Tile Designer to be converted in to different file formats for use in Game Boy game development (e.g.: with GBDK)"

  s.files = Dir["lib/**/*", "bin/*", "README.md", "LICENSE"]

  s.require_paths << "lib"
  s.bindir = "bin"
  s.executables << "gbr"
  s.executables << "gbm"

  s.add_runtime_dependency("gli", "2.12.2")

  s.add_development_dependency("rspec", "3.3.0")
end