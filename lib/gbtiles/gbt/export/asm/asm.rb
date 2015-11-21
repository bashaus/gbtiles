require "gbtiles/gbt/export/asm/converter"
require "erb"

module GBTiles
  module GBT
    module Export
      module ASM
        class ASM
          include ERB::Util

          attr_accessor :bank
          attr_accessor :label
          attr_accessor :mod_data
          attr_accessor :converter

          def initialize
            @converter = GBTiles::GBT::Export::ASM::Converter.new
          end

          def prerender
            if !@bank.is_a? Numeric then
              raise "Bank must be numeric"
            end

            if @mod_data.nil? then
              raise "Missing required mod data"
            end

            @label ||= mod_data.name
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
