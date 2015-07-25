module GBTiles
  module GBM
    module Map
      class Object

        attr_accessor :object_type
        attr_accessor :object_id
        attr_accessor :master_id

        def initialize object_type
          @object_type = object_type
        end
      end
    end
  end
end
