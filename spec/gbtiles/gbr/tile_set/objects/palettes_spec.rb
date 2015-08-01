require "gbtiles/gbr/tile_set/objects/palettes"

RSpec.describe GBTiles::GBR::TileSet::Objects::Palettes, "#initFromBitString" do
  before do
    @file = File.open "spec/fixtures/palettes/partial.gbr", "rb"
    @palettes = GBTiles::GBR::TileSet::Objects::Palettes.initFromBitString @file.read
  end

  it "validates object type" do
    expect(@palettes.object_type).to eql GBTiles::GBR::TileSet::OBJECT_TYPE[:palettes]
  end

  it "reads the id" do
    expect(@palettes.id).to eql 1
  end
  
  it "reads the count" do
    expect(@palettes.count).to eql 8
  end
  
  it "reads the colors" do
    expect(@palettes.colors.length).to eql @palettes.count
  end
  
  it "reads the sgb_count"
  it "reads the sgb_colors"
end
