require "gbtiles/gbr/tile_set/objects/tile_data"

RSpec.describe GBTiles::GBR::TileSet::Objects::TileData, "#initFromBitString" do
  before do
    file = File.open "spec/fixtures/tile_data/partial.gbr", "rb"
    @tile_data = GBTiles::GBR::TileSet::Objects::TileData.initFromBitString file.read
  end

  it "validates object type" do
    expect(@tile_data.object_type).to eql GBTiles::GBR::TileSet::OBJECT_TYPE[:tile_data]
  end

  it "expects name to be nil" do
    expect(@tile_data.name).to be_nil
  end

  it "reads the tile width" do
    expect(@tile_data.width).to eql 8
  end

  it "reads the tile height" do
    expect(@tile_data.height).to eql 8
  end

  it "reads the number of tiles" do
    expect(@tile_data.count).to eql 128
  end

  it "the number of tiles matches the data" do
    expect(@tile_data.data.length / (@tile_data.width * @tile_data.height)).to eql @tile_data.count
  end

  context "renders a tile" do
    it "renders" do
      blank_tile = "0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00"

      expected_results = {
        48 => "0x00,0x00,0x38,0x38,0x44,0x44,0x4c,0x4c,0x54,0x54,0x64,0x64,0x38,0x38,0x00,0x00",
        49 => "0x00,0x00,0x30,0x30,0x50,0x50,0x10,0x10,0x10,0x10,0x10,0x10,0x7c,0x7c,0x00,0x00",
        50 => "0x00,0x00,0x38,0x38,0x44,0x44,0x08,0x08,0x10,0x10,0x20,0x20,0x7c,0x7c,0x00,0x00",
        51 => "0x00,0x00,0x38,0x38,0x44,0x44,0x04,0x04,0x18,0x18,0x44,0x44,0x38,0x38,0x00,0x00",
        52 => "0x00,0x00,0x40,0x40,0x40,0x40,0x48,0x48,0x7c,0x7c,0x08,0x08,0x08,0x08,0x00,0x00",
        53 => "0x00,0x00,0x7c,0x7c,0x40,0x40,0x78,0x78,0x04,0x04,0x44,0x44,0x38,0x38,0x00,0x00",
        54 => "0x00,0x00,0x38,0x38,0x44,0x44,0x40,0x40,0x78,0x78,0x44,0x44,0x38,0x38,0x00,0x00",
        55 => "0x00,0x00,0x3c,0x3c,0x04,0x04,0x08,0x08,0x10,0x10,0x20,0x20,0x40,0x40,0x00,0x00",
        56 => "0x00,0x00,0x38,0x38,0x44,0x44,0x44,0x44,0x38,0x38,0x44,0x44,0x38,0x38,0x00,0x00",
        57 => "0x00,0x00,0x38,0x38,0x44,0x44,0x3c,0x3c,0x04,0x04,0x44,0x44,0x38,0x38,0x00,0x00",
        65 => "0x00,0x00,0x38,0x38,0x44,0x44,0x44,0x44,0x7c,0x7c,0x44,0x44,0x44,0x44,0x00,0x00",
        66 => "0x00,0x00,0x70,0x70,0x48,0x48,0x78,0x78,0x44,0x44,0x44,0x44,0x78,0x78,0x00,0x00",
        67 => "0x00,0x00,0x38,0x38,0x44,0x44,0x40,0x40,0x40,0x40,0x44,0x44,0x38,0x38,0x00,0x00",
        68 => "0x00,0x00,0x78,0x78,0x44,0x44,0x44,0x44,0x44,0x44,0x44,0x44,0x78,0x78,0x00,0x00",
        69 => "0x00,0x00,0x7c,0x7c,0x40,0x40,0x78,0x78,0x40,0x40,0x40,0x40,0x7c,0x7c,0x00,0x00",
        70 => "0x00,0x00,0x7c,0x7c,0x40,0x40,0x78,0x78,0x40,0x40,0x40,0x40,0x40,0x40,0x00,0x00",
        71 => "0x00,0x00,0x38,0x38,0x44,0x44,0x40,0x40,0x4c,0x4c,0x44,0x44,0x38,0x38,0x00,0x00",
        72 => "0x00,0x00,0x44,0x44,0x44,0x44,0x44,0x44,0x7c,0x7c,0x44,0x44,0x44,0x44,0x00,0x00",
        73 => "0x00,0x00,0x7c,0x7c,0x10,0x10,0x10,0x10,0x10,0x10,0x10,0x10,0x7c,0x7c,0x00,0x00",
        74 => "0x00,0x00,0x7c,0x7c,0x10,0x10,0x10,0x10,0x10,0x10,0x50,0x50,0x20,0x20,0x00,0x00",
        75 => "0x00,0x00,0x44,0x44,0x48,0x48,0x70,0x70,0x50,0x50,0x48,0x48,0x44,0x44,0x00,0x00",
        76 => "0x00,0x00,0x40,0x40,0x40,0x40,0x40,0x40,0x40,0x40,0x40,0x40,0x7c,0x7c,0x00,0x00",
        77 => "0x00,0x00,0x44,0x44,0x6c,0x6c,0x54,0x54,0x44,0x44,0x44,0x44,0x44,0x44,0x00,0x00",
        78 => "0x00,0x00,0x44,0x44,0x64,0x64,0x54,0x54,0x4c,0x4c,0x44,0x44,0x44,0x44,0x00,0x00",
        79 => "0x00,0x00,0x38,0x38,0x44,0x44,0x44,0x44,0x44,0x44,0x44,0x44,0x38,0x38,0x00,0x00",
        80 => "0x00,0x00,0x78,0x78,0x44,0x44,0x78,0x78,0x40,0x40,0x40,0x40,0x40,0x40,0x00,0x00",
        81 => "0x00,0x00,0x38,0x38,0x44,0x44,0x44,0x44,0x54,0x54,0x48,0x48,0x34,0x34,0x00,0x00",
        82 => "0x00,0x00,0x78,0x78,0x44,0x44,0x78,0x78,0x50,0x50,0x48,0x48,0x44,0x44,0x00,0x00",
        83 => "0x00,0x00,0x3c,0x3c,0x40,0x40,0x38,0x38,0x04,0x04,0x44,0x44,0x38,0x38,0x00,0x00",
        84 => "0x00,0x00,0x7c,0x7c,0x10,0x10,0x10,0x10,0x10,0x10,0x10,0x10,0x10,0x10,0x00,0x00",
        85 => "0x00,0x00,0x44,0x44,0x44,0x44,0x44,0x44,0x44,0x44,0x44,0x44,0x38,0x38,0x00,0x00",
        86 => "0x00,0x00,0x44,0x44,0x44,0x44,0x28,0x28,0x28,0x28,0x10,0x10,0x10,0x10,0x00,0x00",
        87 => "0x00,0x00,0x42,0x42,0x42,0x42,0x42,0x42,0x4a,0x4a,0x2a,0x2a,0x14,0x14,0x00,0x00",
        88 => "0x00,0x00,0x44,0x44,0x28,0x28,0x28,0x28,0x10,0x10,0x28,0x28,0x44,0x44,0x00,0x00",
        89 => "0x00,0x00,0x44,0x44,0x44,0x44,0x28,0x28,0x10,0x10,0x10,0x10,0x10,0x10,0x00,0x00",
        90 => "0x00,0x00,0x7c,0x7c,0x04,0x04,0x08,0x08,0x10,0x10,0x20,0x20,0x7c,0x7c,0x00,0x00"
      }

      (48..(@tile_data.count - 1)).each do |i|
        if (expected_results.include?(i)) then
          expect(@tile_data.render_tile i).to eql expected_results[i]
        else
          expect(@tile_data.render_tile i).to eql blank_tile
        end
      end
    end
  end
end
