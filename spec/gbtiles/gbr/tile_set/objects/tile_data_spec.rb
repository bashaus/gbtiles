require "gbtiles/gbr/tile_set/objects/tile_data"

RSpec.describe GBTiles::GBR::TileSet::Objects::TileData, "#initFromBitString" do
  before do
    file = File.open "spec/fixtures/tile_data/partial.gbr", "rb"
    @tile_data = GBTiles::GBR::TileSet::Objects::TileData.initFromBitString file.read
  end

  it "validates object type" do
    expect(@tile_data.object_type).to eql GBTiles::GBR::TileSet::OBJECT_TYPE[:tile_data]
  end

  it "expects name to be nil" do
    expect(@tile_data.name).to be_nil
  end

  it "reads the tile width" do
    expect(@tile_data.width).to eql 8
  end

  it "reads the tile height" do
    expect(@tile_data.height).to eql 8
  end

  it "reads the number of tiles" do
    expect(@tile_data.count).to eql 128
  end

  it "the number of tiles matches the data" do
    expect(@tile_data.data.length / (@tile_data.width * @tile_data.height)).to eql @tile_data.count
  end
end
