require "gbtiles/helpers/data_type"
require "gbtiles/gbm/import/gbm_file"
require "gbtiles/gbm/export/asm/asm"

desc "Convert a file from GBM format"
arg_name "input"
command :convert do |c|

  c.desc "Output filename [*.s]"
  c.flag :output

  c.desc "Layer type of the map [bkg, win, sprite]"
  c.flag :layer,
    :must_match => [:bkg, :win, :sprite],
    :default_value => :bkg

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
    export.layer = options[:layer]
    export.write(output_file)
    output_file.close
  end
end
