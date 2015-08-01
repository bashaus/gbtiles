require "gbtiles/gbr/tile_set/objects/tile_pal"

RSpec.describe GBTiles::GBR::TileSet::Objects::TilePal, "#initFromBitString" do
  before do
    file = File.open "spec/fixtures/gbr/tile_pal/partial.gbr", "rb"
    @tile_pal = GBTiles::GBR::TileSet::Objects::TilePal.initFromBitString file.read
  end

  it "expect object type to be :tile_pal" do
    expect(@tile_pal.object_type).to eql GBTiles::GBR::TileSet::OBJECT_TYPE[:tile_pal]
  end

  it "reads the id" do 
  	expect(@tile_pal.id).to eql 1
  end
  it "reads the count" do 
  	expect(@tile_pal.count).to eql 128
  end
  it "reads the color_set" do 
  	expect(@tile_pal.color_set.length).to eql @tile_pal.count
  end
  it "reads the sgb_count" do 
  	expect(@tile_pal.sgb_count).to eql 0
  end
  it "reads the sgb_color_set" do 
  	expect(@tile_pal.sgb_color_set.length).to eql 0
  end
end