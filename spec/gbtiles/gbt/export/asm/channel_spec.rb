require "gbtiles/gbt/export/asm/channel"

RSpec.describe GBTiles::GBT::Export::ASM::Channel, "#note_index" do
  before do
    @channel = GBTiles::GBT::Export::ASM::Channels::Pulse.new(1)
  end

  context "extremes out of bounds" do
    it "throws an error on 1713 (upper)" do
      @channel.data = [0xF6, 0xB1, 0xFF, 0xFF]
      expect { @channel.note_index }.to raise_error
    end

    it "throws an error on 27 (lower)" do
      @channel.data = [0xF0, 0x1B, 0xFF, 0xFF]
      expect { @channel.note_index }.to raise_error
    end
  end

  context "extremes inside bounds" do
    it "accepts the lower bounds" do
      @channel.data = [0xF0, 0x1C, 0xFF, 0xFF]
      expect(@channel.note_index).to eql 71
    end

    it "accepts the upper bounds" do
      @channel.data = [0xF6, 0xB0, 0xFF, 0xFF]
      expect(@channel.note_index).to eql 0
    end
  end

  context "finds nearest value" do
    it "converts 240 to 34" do
      @channel.data = [0xF0, 0xF0, 0xFF, 0xFF]
      expect(@channel.note_index).to eql 34
    end

    it "converts 246 to 34" do
      @channel.data = [0xF0, 0xF6, 0xFF, 0xFF]
      expect(@channel.note_index).to eql 34
    end

    it "converts 247 to 33" do
      @channel.data = [0xF0, 0xF7, 0xFF, 0xFF]
      expect(@channel.note_index).to eql 33
    end

    it "converts 248 to 33" do
      @channel.data = [0xF0, 0xF8, 0xFF, 0xFF]
      expect(@channel.note_index).to eql 33
    end

    it "converts 254 to 33" do
      @channel.data = [0xF0, 0xFE, 0xFF, 0xFF]
      expect(@channel.note_index).to eql 33
    end
  end
end

RSpec.describe GBTiles::GBT::Export::ASM::Channel, "#data" do
  before do
    @channel = GBTiles::GBT::Export::ASM::Channels::Pulse.new(1)
  end

  it "reads/writes an array to the variable" do
    data = [ 0x10, 0x20, 0x30, 0x40 ]
    @channel.data = data
    expect(@channel.data).to eql data
  end

  it "reads/writes an unpacked string" do
    data = "\x10\x20\x10\x40".b
    @channel.data = data
    expect(@channel.data).to eql [ 0x10, 0x20, 0x10, 0x40 ]
    expect(@channel.data).to_not eql [ 0x10, 0x20, 0x30, 0x40 ]
  end
end
