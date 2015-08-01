require "gbtiles/gbr/tile_set/objects/tile_import"

RSpec.describe GBTiles::GBR::TileSet::Objects::TileImport, "#initFromBitString" do
  before do
    file = File.open "spec/fixtures/gbr/tile_import/partial.gbr", "rb"
    @tile_import = GBTiles::GBR::TileSet::Objects::TileImport.initFromBitString file.read
  end

  it "expect object type to be :tile_import" do
    expect(@tile_import.object_type).to eql GBTiles::GBR::TileSet::OBJECT_TYPE[:tile_import]
  end

  it "reads the tile id" do
    expect(@tile_import.tile_id).to eql 1
  end

  it "reads the file name" do
    expect(@tile_import.file_name).to be_nil
  end

  it "reads the file type" do
    expect(@tile_import.file_type).to eql 0
  end

  it "reads the from tile" do
    expect(@tile_import.from_tile).to eql 0
  end

  it "reads the to tile" do
    expect(@tile_import.to_tile).to eql 0
  end

  it "reads the tile count" do
    expect(@tile_import.tile_count).to eql 127
  end

  it "reads the color conversion" do
    expect(@tile_import.color_conversion).to eql 0
  end

  it "reads the first byte" do
    expect(@tile_import.first_byte).to eql 0
  end

  it "reads the binary file type" do
    expect(@tile_import.binary_file_type).to eql 0
  end
end
