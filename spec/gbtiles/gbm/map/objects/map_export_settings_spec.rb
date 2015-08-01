require "gbtiles/gbm/map/objects/map_export_settings"

RSpec.describe GBTiles::GBM::Map::Objects::MapExportSettings, "#initFromBitString" do
  before do
    @file = File.open "spec/fixtures/gbm/map_export_settings/partial.gbm", "rb"
    @map_export_settings = GBTiles::GBM::Map::Objects::MapExportSettings.initFromBitString @file.read
  end

  it "validates object type" do
    expect(@map_export_settings.object_type).to eql GBTiles::GBM::Map::OBJECT_TYPE[:map_export_settings]
  end

  it "reads the file_name" do
    expect(@map_export_settings.file_name).to eql "dialog.z80"
  end

  it "reads the file_type" do
    expect(@map_export_settings.file_type).to eql 0
  end

  it "reads the section_name" do
    expect(@map_export_settings.section_name).to eql "DialogMap"
  end

  it "reads the label_name" do
    expect(@map_export_settings.label_name).to eql "DialogMap"
  end

  it "reads the bank" do
    expect(@map_export_settings.bank).to eql 1
  end

  it "reads the plane_count" do
    expect(@map_export_settings.plane_count).to eql 0
  end

  it "reads the plane_order" do
    expect(@map_export_settings.plane_order).to eql 0
  end

  it "reads the map_layout" do
    expect(@map_export_settings.map_layout).to eql 0
  end

  it "reads the split" do
    expect(@map_export_settings.split).to eql false
  end

  it "reads the split_size" do
    expect(@map_export_settings.split_size).to eql 0
  end

  it "reads the split_bank" do
    expect(@map_export_settings.split_bank).to eql false
  end

  it "reads the sel_tab" do
    expect(@map_export_settings.sel_tab).to eql 0
  end

  it "reads the prop_count" do
    expect(@map_export_settings.prop_count).to eql 1
  end

  it "reads the tile_offset" do
    expect(@map_export_settings.tile_offset).to eql 0
  end

end
