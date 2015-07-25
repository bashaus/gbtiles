# require "gbtiles/gbr/import/gbr_file"

# RSpec.describe GBTiles::GBR::Import::GBRFile, "#open" do
#   context "with an invalid file header" do
#   end

#   context "with a valid file header" do
#     before do
#       @file = File.open "spec/fixtures/win.gbr"
#     end

#     it "validates a file" do
#       @gbr = GBTiles::GBR::Import::GBRFile.open @file

#       expect(@gbr.tile_set.producer.count).to eql 1

#       producer = @gbr.tile_set.producer.first

#       expect(producer.object_type).to eql GBTiles::GBR::TileSet::OBJECT_TYPE[:producer]
#       expect(producer.name).to eql "Gameboy Tile Designer"
#       expect(producer.version).to eql "2.2"
#       expect(producer.info).to eql "Home: www.casema.net/~hpmulder"
#     end
#   end
# end