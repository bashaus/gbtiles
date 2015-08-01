require "gbtiles/gbm/map/objects/producer"

RSpec.describe GBTiles::GBM::Map::Objects::Producer, "#initFromBitString" do
  before do
    @file = File.open "spec/fixtures/gbm/producer/partial.gbm", "rb"
    @producer = GBTiles::GBM::Map::Objects::Producer.initFromBitString @file.read
  end

  it "validates object type" do
    expect(@producer.object_type).to eql GBTiles::GBR::TileSet::OBJECT_TYPE[:producer]
  end

  it "reads the name object" do
    expect(@producer.name).to eql "Gameboy Map Builder"
  end

  it "reads the version object" do
    expect(@producer.version).to eql "1.8"
  end

  it "reads the info object" do
    expect(@producer.info).to eql "Home: http://www.casema.net/~hpmulder"
  end
end
