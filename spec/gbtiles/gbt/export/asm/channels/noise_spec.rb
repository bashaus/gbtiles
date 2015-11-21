require "gbtiles/gbt/export/asm/channels/noise"

RSpec.describe GBTiles::GBT::Export::ASM::Channels::Noise, "#initialize" do
  before do
    @channel = GBTiles::GBT::Export::ASM::Channels::Noise.new
  end

  it "is not a pulse channel" do
    expect(@channel.is_pulse?).to eql false
  end

  it "is not a wav channel" do
    expect(@channel.is_wav?).to eql false
  end

  it "is a noise channel" do
    expect(@channel.is_noise?).to eql true
  end
end
