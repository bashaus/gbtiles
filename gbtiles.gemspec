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
  s.summary     = "Converts .GBR, .GBM and .MOD files to different Game Boy formats"
  s.description = "Allows files created with Harry Mulder's Game Boy Map Builder " +
                  "and Game Boy Tile Designer to be converted for use in " +
                  "Game Boy game development. Also allows .MOD tracker files " +
                  "to be converted for use with AntonioND's GBT Player."

  s.files = Dir["lib/**/*", "bin/*", "README.md", "LICENSE"]

  s.require_paths << "lib"
  s.bindir = "bin"
  s.executables << "gbr"
  s.executables << "gbm"
  s.executables << "gbt"

  s.add_runtime_dependency("gli", "~> 2.13")

  s.add_development_dependency("rspec", "3.3.0")
end