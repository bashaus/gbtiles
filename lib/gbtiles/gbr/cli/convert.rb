require "gbtiles/data_type"

require "gbtiles/gbr/tile_set/tile_set"
require "gbtiles/gbr/tile_set/object"
require "gbtiles/gbr/tile_set/object_type"
require "gbtiles/gbr/tile_set/split_order"
require "gbtiles/gbr/tile_set/color_set"

require "gbtiles/gbr/tile_set/objects/palettes"
require "gbtiles/gbr/tile_set/objects/producer"
require "gbtiles/gbr/tile_set/objects/tile_data"
require "gbtiles/gbr/tile_set/objects/tile_export"
require "gbtiles/gbr/tile_set/objects/tile_import"
require "gbtiles/gbr/tile_set/objects/tile_pal"
require "gbtiles/gbr/tile_set/objects/tile_settings"
require "gbtiles/gbr/tile_set/objects/unknown"

require "gbtiles/gbr/import/gbr_file"

require "gbtiles/gbr/export/asm/asm"

desc "Convert a file from GBR format"
arg_name "input"
command :convert do |c|

  c.desc "Output filename (*.s)"
  c.flag :output

  c.action do |global_options,options,args|
    # Prepare input file
    if !args[0].nil? then
      # Use file
      input_file = File.open(args[0], "rb")
    else
      # Use STDIN
      input_file = $stdin
    end

    # Prepare output file
    if !options[:output].nil? then
      # Use file
      output_file = File.open(options[:output], "w")
    else
      # Use STDOUT
      output_file = $stdout
    end

    # Do import
    import = GBTiles::GBR::Import::GBRFile.open(input_file)
    input_file.close

    # Do export
    export = GBTiles::GBR::Export::ASM::ASM.new
    export.tile_set = import.tile_set
    export.write(output_file)
    output_file.close
  end
end
