module GBTiles
  module GBM
    module Map
      module Objects
        class Producer < GBTiles::GBM::Map::Object

          attr_accessor :name
          attr_accessor :version
          attr_accessor :info

          def initialize
            super GBTiles::GBM::Map::ObjectType::PRODUCER
          end

          def self.initFromBitString(src)
            object = GBTiles::GBM::Map::Objects::Producer.new

            object.name     = GBTiles::DataType.string!(src, 128)
            object.version  = GBTiles::DataType.string!(src, 10)
            object.info     = GBTiles::DataType.string!(src, 128)

            object
          end
        end
      end
    end
  end
end
