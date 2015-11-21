require "gbtiles/helpers/data_type"
require "gbtiles/gbt/import/mod_file"
require "gbtiles/gbt/export/asm/asm"

desc "Converts .MOD files to different formats for the Game Boy"
arg_name "input"
command :convert do |c|

  c.desc "Output filename [*.s]"
  c.flag :output

  c.desc "ROM Bank"
  c.default_value 2
  c.flag :bank

  c.desc "Label"
  c.flag :label

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
    import = GBTiles::GBT::Import::MODFile.open(input_file)
    input_file.close

    # Do export
    export = GBTiles::GBT::Export::ASM::ASM.new
    export.bank = options[:bank].to_i
    export.mod_data = import.mod_data

    if !options[:label].nil? then
      # Use label from CLI
      export.label = options[:label]
    elsif !options[:output].nil? then
      # Use filename
      export.label = File.basename(options[:output], ".*")
    end

    export.write(output_file)
    output_file.close
  end
end
