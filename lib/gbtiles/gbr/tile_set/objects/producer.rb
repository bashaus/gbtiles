module GBTiles
  module GBR
    module TileSet
      module Objects
        class Producer < GBTiles::GBR::TileSet::Object

          attr_accessor :name
          attr_accessor :version
          attr_accessor :info

          def initialize
            super GBTiles::GBR::TileSet::ObjectType::PRODUCER
          end

          def self.initFromBitString src
            object = GBTiles::GBR::TileSet::Objects::Producer.new

            object.name     = GBTiles::DataType.string!(src, 30)
            object.version  = GBTiles::DataType.string!(src, 10)
            object.info     = GBTiles::DataType.string!(src, 80)

            object
          end
        end
      end
    end
  end
end
