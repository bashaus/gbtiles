require "gbtiles/gbr/import/gbr_file"

RSpec.describe GBTiles::GBR::Import::GBRFile, "#open" do
  context "with an invalid file header" do
    before do
      @file = File.open "spec/fixtures/gbr_file/invalid-header.gbr", "rb"
    end

    it "raises an error" do
      expect { @gbr = GBTiles::GBR::Import::GBRFile.open @file }.to raise_error(IOError)
    end
  end

  context "with a valid file header" do
    before do
      @file = File.open "spec/fixtures/gbr_file/valid.gbr", "rb"
    end

    it "doesn't raise an error" do
      expect { @gbr = GBTiles::GBR::Import::GBRFile.open @file }.not_to raise_error(IOError)
    end

    context "on file process" do
      before do
        @gbr = GBTiles::GBR::Import::GBRFile.open @file
      end

      it "has one producer" do
        expect(@gbr.tile_set.producer.count).to eql 1
        producer = @gbr.tile_set.producer.first
      end
    end
  end
end