require "gbtiles/gbm/map/objects/map_tile_data"

RSpec.describe GBTiles::GBM::Map::Objects::MapTileData, "#initFromBitString" do
  before do
    @file = File.open "spec/fixtures/gbm/map_tile_data/partial.gbm", "rb"
    @map_tile_data = GBTiles::GBM::Map::Objects::MapTileData.initFromBitString @file.read
  end

  it "validates object type" do
    expect(@map_tile_data.object_type).to eql GBTiles::GBM::Map::OBJECT_TYPE[:map_tile_data]
  end

  it "has the correct number of records" do
    expect(@map_tile_data.records.count).to eql 80
  end

  context "first character (2x2)" do
    before do
      @tile = @map_tile_data.records[21]
    end

    it "reads the tile_number" do
      expect(@tile.tile_number).to eql 76
    end

    it "reads the gbc_palette" do
      expect(@tile.gbc_palette).to eql 0
    end

    it "reads the sgb_palette" do
      expect(@tile.sgb_palette).to eql 0
    end

    it "reads the flipped_horizontally" do
      expect(@tile.flipped_horizontally).to eql 0
    end

    it "reads the flipped_vertically" do
      expect(@tile.flipped_vertically).to eql 0
    end
  end

end