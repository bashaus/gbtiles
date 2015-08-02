require "gbtiles/gbm/layer"

require "erb"

module GBTiles
  module GBM
    module Export
      module ASM
        class ASM
          include ERB::Util

          attr_accessor :map_set
          attr_accessor :layer

          def initialize
          end

          def prerender
            if @map_set.nil? then
              raise "Missing required map"
            end

            if @layer.nil? then
              raise "Missing required layer (bkg, win, sprite)"
            end
          end

          def render_s
            prerender

            template = File.open(File.join(__dir__, "asm.s.erb"), "r").read

            ERB.new(template, nil, "-").result(binding)
          end

          def render_h
            prerender

            template = File.open(File.join(__dir__, "asm.h.erb"), "r").read

            ERB.new(template, nil, "-").result(binding)
          end

          def write output_stream
            output_stream.write(render_s)

            if output_stream.is_a? File then
              header_filename = "#{File.basename(output_stream.path, ".s")}.h"
              header_path = "#{File.dirname(File.expand_path(output_stream.path))}/#{header_filename}"
              header_stream = File.open(header_path, "w")
              header_stream.write(render_h)
              header_stream.close
            end
          end
        end
      end
    end
  end
end
