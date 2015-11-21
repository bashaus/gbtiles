require "gbtiles/helpers/fixnum"

require "gbtiles/gbt/mod_data/mod_data"
require "gbtiles/gbt/mod_data/sample"
require "gbtiles/gbt/mod_data/pattern"

module GBTiles
  module GBT
    module Import
      class MODFile

        attr_accessor :mod_data

        def initialize
          @mod_data = GBTiles::GBT::MODData::MODData.new
        end

        def self.open file
          import = GBTiles::GBT::Import::MODFile.new

          import.mod_data.name = GBTiles::DataType.string(file.read(20))

          for i in 0..30
            sample_data = file.read(30)

            sample = GBTiles::GBT::MODData::Sample.new
            sample.name = GBTiles::DataType.string!(sample_data, 22)
            sample.length = GBTiles::DataType.bword!(sample_data)
            sample.finetune = GBTiles::DataType.byte!(sample_data)
            sample.volume = GBTiles::DataType.byte!(sample_data)
            sample.repeat_point = GBTiles::DataType.bword!(sample_data)
            sample.repeat_length = GBTiles::DataType.bword!(sample_data)

            import.mod_data.samples << sample
          end

          import.mod_data.song_length = GBTiles::DataType.byte(file.read(1))
          file.read(1) # unused

          for i in 0..127
            import.mod_data.pattern_table << GBTiles::DataType.byte(file.read(1))
          end

          import.mod_data.identifier = GBTiles::DataType.string(file.read(4))

          for i in 0..63
            pattern = GBTiles::GBT::MODData::Pattern.new

            for j in 0..63
              pattern.rows << file.read(16)
            end

            import.mod_data.patterns << pattern
          end

          if import.mod_data.identifier != "M.K." then
            raise IOError, "Invalid identifier in .MOD: expected `M.K.` got `#{import.mod_data.identifier}`"
          end

          import
        end
      end
    end
  end
end
