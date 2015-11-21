require "gbtiles/gbt/export/asm/channels/wav"

RSpec.describe GBTiles::GBT::Export::ASM::Effects, "#effect_volume" do
  it "always throws an error" do
    @channel = GBTiles::GBT::Export::ASM::Channel.new 1
    expect { @channel.effect_volume }.to raise_error
  end
end
