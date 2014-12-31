module GBTiles
  module GBR
    module TileSet
      class Object

        attr_accessor :object_id
        @object_id

        attr_accessor :object_type
        @object_type

        def initialize object_type
          @object_type = object_type
        end
      end
    end
  end
end
