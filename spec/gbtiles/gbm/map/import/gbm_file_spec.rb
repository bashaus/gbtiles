require "gbtiles/gbm/import/gbm_file"

RSpec.describe GBTiles::GBM::Import::GBMFile, "#open" do
  context "with an invalid file header" do
    before do
      @file = File.open "spec/fixtures/gbm/gbm_file/invalid-header.gbm", "rb"
    end

    it "raises an error" do
      expect { GBTiles::GBM::Import::GBMFile.open @file }.to raise_error(IOError)
    end
  end

  context "with an invalid version in the file header" do
    before do
      @file = File.open "spec/fixtures/gbm/gbm_file/invalid-version.gbm", "rb"
    end

    it "raises an error" do
      expect { GBTiles::GBM::Import::GBMFile.open @file }.to raise_error(IOError)
    end
  end

  context "with an invalid header marker" do
    before do
      @file = File.open "spec/fixtures/gbm/gbm_file/invalid-marker.gbm", "rb"
    end

    it "raises an error" do
      expect { GBTiles::GBM::Import::GBMFile.open @file }.to raise_error
    end
  end

  context "with a valid file header" do
    before do
      @file = File.open "spec/fixtures/gbm/gbm_file/valid.gbm", "rb"
    end

    it "doesn't raise an error" do
      expect { @gbm = GBTiles::GBM::Import::GBMFile.open @file }.not_to raise_error(IOError)
    end

    context "on file process" do
      before do
        @gbm = GBTiles::GBM::Import::GBMFile.open @file
      end

      it "has one producer object" do
        expect(@gbm.map_set.producer.count).to eql 1
      end

      it "has one map object" do
        expect(@gbm.map_set.map.count).to eql 1
      end

      it "has one map_tile_data object" do
        expect(@gbm.map_set.map_tile_data.count).to eql 1
      end

      it "has one map_settings object" do
        expect(@gbm.map_set.map_settings.count).to eql 1
      end

      it "has one map_export_settings object" do
        expect(@gbm.map_set.map_export_settings.count).to eql 1
      end

      # it "has no deleted objects" do
      #   expect(@gbm.map_set.deleted.count).to eql 0
      # end

      # it "has no unknown objects" do
      #   expect(@gbm.map_set.unknown.count).to eql 0
      # end

    end
  end
end