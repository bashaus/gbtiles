require "gbtiles/gbt/import/mod_file"

RSpec.describe GBTiles::GBT::Import::MODFile, "#open" do
  context "with an invalid identifier" do
    before do
      @file = File.open "spec/fixtures/gbt/mod_file/invalid-identifier.mod", "rb"
    end

    it "raises an error" do
      expect { @mod = GBTiles::GBT::Import::MODFile.open @file }.to raise_error(IOError)
    end
  end

  context "with a valid file header" do
    before do
      @file = File.open "spec/fixtures/gbt/mod_file/valid.mod", "rb"
    end

    it "doesn't raise an error" do
      expect { @mod = GBTiles::GBT::Import::MODFile.open @file }.not_to raise_error(IOError)
    end

    context "on file process" do
      before do
        @mod = GBTiles::GBT::Import::MODFile.open @file
      end

      it "reads the name" do
        expect(@mod.mod_data.name).to eql "untitled"
      end

      it "reads all the samples" do
        expect(@mod.mod_data.samples.count).to eql 31
      end

      it "reads the song length" do
        expect(@mod.mod_data.song_length).to eql 4
      end

      it "reads all the pattern table" do
        expect(@mod.mod_data.pattern_table.count).to eql 128
      end

      it "reads the pattern table data" do
        expect(@mod.mod_data.pattern_table[0]).to eql 0
        expect(@mod.mod_data.pattern_table[1]).to eql 1
        expect(@mod.mod_data.pattern_table[2]).to eql 2
        expect(@mod.mod_data.pattern_table[3]).to eql 3
      end

      it "reads the identifier" do
        expect(@mod.mod_data.identifier).to eql "M.K."
      end

      it "reads all the patterns" do
        expect(@mod.mod_data.patterns.count).to eql 64
      end
    end
  end
end
