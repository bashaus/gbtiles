module GBTiles
  module GBT
    module MODData
      class MODData

        attr_accessor :name
        attr_accessor :samples
        attr_accessor :song_length
        attr_accessor :pattern_table
        attr_accessor :identifier
        attr_accessor :patterns

        def initialize
          @samples = []
          @pattern_table = []
          @patterns = []
        end
      end
    end
  end
end
