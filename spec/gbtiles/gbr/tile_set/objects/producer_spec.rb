require "gbtiles/gbr/import/gbr_file"

RSpec.describe GBTiles::GBR::TileSet::Objects::Producer, "#initFromBitString" do
  before do
    @file = File.open "spec/fixtures/producer/partial.gbr", "rb"
  end

  it "reads data" do
    producer = GBTiles::GBR::TileSet::Objects::Producer.initFromBitString @file.read

    expect(producer.object_type).to eql GBTiles::GBR::TileSet::OBJECT_TYPE[:producer]
    expect(producer.name).to eql "Gameboy Tile Designer"
    expect(producer.version).to eql "2.2"
    expect(producer.info).to eql "Home: www.casema.net/~hpmulder"
  end
end
