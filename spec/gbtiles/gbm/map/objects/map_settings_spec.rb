require "gbtiles/gbm/map/objects/map_settings"

RSpec.describe GBTiles::GBM::Map::Objects::MapSettings, "#initFromBitString" do
  before do
    @file = File.open "spec/fixtures/gbm/map_settings/partial.gbm", "rb"
    @map_settings = GBTiles::GBM::Map::Objects::MapSettings.initFromBitString @file.read
  end

  it "validates object type" do
    expect(@map_settings.object_type).to eql GBTiles::GBM::Map::OBJECT_TYPE[:map_settings]
  end

  it "reads the form_width" do
    expect(@map_settings.form_width).to eql 605
  end

  it "reads the form_height" do
    expect(@map_settings.form_height).to eql 498
  end

  it "reads the form_maximized" do
    expect(@map_settings.form_maximized).to eql false
  end

  it "reads the info_panel" do
    expect(@map_settings.info_panel).to eql true
  end

  it "reads the grid" do
    expect(@map_settings.grid).to eql true
  end

  it "reads the double_markers" do
    expect(@map_settings.double_markers).to eql false
  end

  it "reads the prop_colors" do
    expect(@map_settings.prop_colors).to eql false
  end

  it "reads the zoom" do
    expect(@map_settings.zoom).to eql 2
  end

  it "reads the color_set" do
    expect(@map_settings.color_set).to eql 0
  end

  it "reads the bookmarks" do
    # expect(@map_settings.bookmarks).to eql "\xFF"
  end

  it "reads the block_fill_pattern" do
    expect(@map_settings.block_fill_pattern).to eql 4294967295
  end

  it "reads the block_fill_width" do
    expect(@map_settings.block_fill_width).to eql 255
  end

  it "reads the block_fill_height" do
    expect(@map_settings.block_fill_height).to eql 256
  end

end