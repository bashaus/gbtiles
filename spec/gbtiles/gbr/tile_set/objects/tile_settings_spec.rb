require "gbtiles/gbr/tile_set/objects/tile_settings"

RSpec.describe GBTiles::GBR::TileSet::Objects::TileSettings, "#initFromBitString" do
  before do
    file = File.open "spec/fixtures/gbr/tile_settings/partial.gbr", "rb"
    @tile_settings = GBTiles::GBR::TileSet::Objects::TileSettings.initFromBitString file.read
  end

  it "expect object type to be :tile_settings" do
    expect(@tile_settings.object_type).to eql GBTiles::GBR::TileSet::OBJECT_TYPE[:tile_settings]
  end

  it "reads the tile_id" do
    expect(@tile_settings.tile_id).to eql 1
  end

  it "reads the simple" do
    expect(@tile_settings.simple).to eql false
  end

  it "reads the flags" do
    expect(@tile_settings.flags).to eql 1
  end

  it "reads the left_color" do
    expect(@tile_settings.left_color).to eql 0
  end

  it "reads the right_color" do
    expect(@tile_settings.right_color).to eql 0
  end

  it "reads the split_width" do
    expect(@tile_settings.split_width).to eql 1
  end

  it "reads the split_height" do
    expect(@tile_settings.split_height).to eql 1
  end

  it "reads the split_order" do
    expect(@tile_settings.split_order).to eql 4294901760
  end

  it "reads the color_set" do
    expect(@tile_settings.color_set).to eql 255
  end

  it "reads the bookmarks"

  it "reads the auto_update"

end