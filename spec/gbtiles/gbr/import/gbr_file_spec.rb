require "gbtiles/gbr/import/gbr_file"

RSpec.describe GBTiles::GBR::Import::GBRFile, "#open" do
  context "with an invalid file header" do
    before do
      @file = File.open "spec/fixtures/gbr_file/invalid-header.gbr"
    end

    it "raises an error" do
      expect { @gbr = GBTiles::GBR::Import::GBRFile.open @file }.to raise_error(IOError)
    end
  end

  context "with a valid file header" do
    before do
      @file = File.open "spec/fixtures/gbr_file/valid.gbr"
    end

    it "doesn't raise an error" do
      expect { @gbr = GBTiles::GBR::Import::GBRFile.open @file }.not_to raise_error(IOError)
    end
  end
end