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

      it "has one producer object" do
        expect(@gbr.tile_set.producer.count).to eql 1
      end

      it "has one tile_data object" do
        expect(@gbr.tile_set.tile_data.count).to eql 1
      end

      it "has one tile_settings object" do
        expect(@gbr.tile_set.tile_settings.count).to eql 1
      end

      it "has one tile_export object" do
        expect(@gbr.tile_set.tile_export.count).to eql 1
      end

      it "has one tile_import object" do
        expect(@gbr.tile_set.tile_import.count).to eql 1
      end

      it "has one palette object" do
        expect(@gbr.tile_set.palettes.count).to eql 1
      end

      it "has one tile_pal object" do
        expect(@gbr.tile_set.tile_pal.count).to eql 1
      end

      it "has no deleted objects" do
        expect(@gbr.tile_set.deleted.count).to eql 0
      end

      it "has no unknown objects" do
        expect(@gbr.tile_set.unknown.count).to eql 0
      end
    end
  end
end