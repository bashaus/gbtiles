require "gbtiles/gbm/map/objects/map"

RSpec.describe GBTiles::GBM::Map::Objects::Map, "#initFromBitString" do
  before do
    @file = File.open "spec/fixtures/gbm/map/partial.gbm", "rb"
    @map = GBTiles::GBM::Map::Objects::Map.initFromBitString @file.read
  end

  it "validates object type" do
    expect(@map.object_type).to eql GBTiles::GBM::Map::OBJECT_TYPE[:map]
  end

  it "reads the name" do
    expect(@map.name).to eql nil
  end

  it "reads the width" do
    expect(@map.width).to eql 20
  end

  it "reads the height" do
    expect(@map.height).to eql 4
  end

  it "reads the prop_count" do
    expect(@map.prop_count).to eql 0
  end

  it "reads the tile_file" do
    expect(@map.tile_file).to eql "C:\\valid.gbr"
  end

  it "reads the tile_count" do
    expect(@map.tile_count).to eql 128
  end

  it "reads the prop_color_count" do
    expect(@map.prop_color_count).to eql 2
  end

end
