require "gbtiles/gbt/export/asm/channels/wav"

RSpec.describe GBTiles::GBT::Export::ASM::Channels::Wav, "#initialize" do
  before do
    @channel = GBTiles::GBT::Export::ASM::Channels::Wav.new
  end

  it "is not a pulse channel" do
    expect(@channel.is_pulse?).to eql false
  end

  it "is a wav channel" do
    expect(@channel.is_wav?).to eql true
  end

  it "is not a noise channel" do
    expect(@channel.is_noise?).to eql false
  end
end
