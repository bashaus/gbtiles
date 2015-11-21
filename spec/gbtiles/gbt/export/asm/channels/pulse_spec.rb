require "gbtiles/gbt/export/asm/channels/pulse"

RSpec.describe GBTiles::GBT::Export::ASM::Channels::Pulse, "#initialize" do
  before do
    @channel = GBTiles::GBT::Export::ASM::Channels::Pulse.new(1)
  end

  it "is a pulse channel" do
    expect(@channel.is_pulse?).to eql true
  end

  it "is not a wav channel" do
    expect(@channel.is_wav?).to eql false
  end

  it "is not a noise channel" do
    expect(@channel.is_noise?).to eql false
  end
end

RSpec.describe GBTiles::GBT::Export::ASM::Channels::Pulse, "#convert" do
  before do
    @channel = GBTiles::GBT::Export::ASM::Channels::Pulse.new(1)
  end

  context "no effect" do
    before do
      @channel.data = [ 0x00, 0x00, 0x00, 0x00 ]
    end

    it "returns no result" do
      expect(@channel.convert).to eql [ 0x0 ]
    end
  end

  context "volume" do
    it "can be max" do
      @channel.data = [ 0x02, 0x3A, 0x8C, 0x40 ]
      expect(@channel.convert).to eql [ 0x93, 0x0F ]
    end

    it "can be min" do
      @channel.data = [ 0x00, 0x00, 0x0C, 0x00 ]
      expect(@channel.convert).to eql [ 0x20 ]
    end
  end  
end
