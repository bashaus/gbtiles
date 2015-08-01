require "gbtiles/gbr/tile_set/objects/producer"

RSpec.describe GBTiles::GBR::TileSet::Objects::Producer, "#initFromBitString" do
  before do
    @file = File.open "spec/fixtures/producer/partial.gbr", "rb"
    @producer = GBTiles::GBR::TileSet::Objects::Producer.initFromBitString @file.read
  end

  it "validates object type" do
    expect(@producer.object_type).to eql GBTiles::GBR::TileSet::OBJECT_TYPE[:producer]
  end

  it "reads the name" do
    expect(@producer.name).to eql "Gameboy Tile Designer"
  end

  it "reads the version" do
    expect(@producer.version).to eql "2.2"
  end

  it "reads the info" do
    expect(@producer.info).to eql "Home: www.casema.net/~hpmulder"
  end
end
