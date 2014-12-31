require "gbtiles/data_type"

require "gbtiles/gbm/import/gbm_file"

require "gbtiles/gbm/map/map_set"

require "gbtiles/gbm/map/object"
require "gbtiles/gbm/map/object_type"

require "gbtiles/gbm/map/objects/producer"
require "gbtiles/gbm/map/objects/map"
require "gbtiles/gbm/map/objects/map_tile_data"
require "gbtiles/gbm/map/objects/map_tile_data_record"
require "gbtiles/gbm/map/objects/map_settings"
require "gbtiles/gbm/map/objects/map_export_settings"
require "gbtiles/gbm/map/objects/unknown"

require "gbtiles/gbm/export/asm/asm"

desc "Convert a file from GBM format"
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
    import = GBTiles::GBM::Import::GBMFile.open(input_file)
    input_file.close

    # Do export
    export = GBTiles::GBM::Export::ASM::ASM.new
    export.map_set = import.map_set
    export.write(output_file)
    output_file.close
  end
end
