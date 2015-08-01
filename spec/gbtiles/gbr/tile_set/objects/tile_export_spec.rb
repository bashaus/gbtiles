require "gbtiles/gbr/tile_set/objects/tile_export"

RSpec.describe GBTiles::GBR::TileSet::Objects::TileExport, "#initFromBitString" do
  before do
    file = File.open "spec/fixtures/gbr/tile_export/partial.gbr", "rb"
    @tile_export = GBTiles::GBR::TileSet::Objects::TileExport.initFromBitString file.read
  end

  it "expect object type to be :tile_export" do
    expect(@tile_export.object_type).to eql GBTiles::GBR::TileSet::OBJECT_TYPE[:tile_export]
  end

  it "reads the tile id" do
    expect(@tile_export.tile_id).to eql 1
  end

  it "reads the filename" do
    expect(@tile_export.file_name).to eql "dialog.z80"
  end

  it "reads the file type" do
    expect(@tile_export.file_type).to eql 0
  end

  it "reads the section name" do
    expect(@tile_export.section_name).to eql "DialogTiles"
  end

  it "reads the label name" do
    expect(@tile_export.label_name).to eql "DialogTiles"
  end

  it "reads the bank number" do
    expect(@tile_export.bank).to eql 1
  end

  it "reads the tile array length" do
    expect(@tile_export.tile_array).to eql 1
  end

  it "reads the format" do
    expect(@tile_export.format).to eql 0
  end

  it "reads the counter" do
    expect(@tile_export.counter).to eql 0
  end

  it "reads the range from" do
    expect(@tile_export.from).to eql 0
  end

  it "reads the range upto" do
    expect(@tile_export.upto).to eql 127
  end

  it "reads the compression" do
    expect(@tile_export.compression).to eql 0
  end

  it "reads the include colors boolean" do
    expect(@tile_export.include_colors).to eql false
  end

  it "reads the SGB palettes" do
    expect(@tile_export.sgb_palettes).to eql 0
  end

  it "reads the GBC palettes" do
    expect(@tile_export.gbc_palettes).to eql 0
  end

  it "reads the make meta tiles" do
    expect(@tile_export.make_meta_tiles).to eql false
  end

  it "reads the meta offset" do
    expect(@tile_export.meta_offset).to eql 0
  end

  it "reads the meta counter" do
    expect(@tile_export.meta_counter).to eql 0
  end

  it "reads the split" do
    expect(@tile_export.split).to eql false
  end

  it "reads the block size" do
    expect(@tile_export.block_size).to eql 0
  end

  it "reads the sel_tab" do
    expect(@tile_export.sel_tab).to eql 0
  end
end
