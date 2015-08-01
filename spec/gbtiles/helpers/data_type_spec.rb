require "gbtiles/helpers/data_type"

RSpec.describe GBTiles::DataType, "#string" do
  context "of undefined length" do
    it "returns a truncated string at a string terminator" do
      string = GBTiles::DataType.string("Lorem ipsum\0dolar sit a met")
      expect(string).to eql("Lorem ipsum")
    end

    it "returns a truncated string at the first instance of a string terminator" do
      string = GBTiles::DataType.string("Lorem ipsum dolar\0sit a\0met")
      expect(string).to eql("Lorem ipsum dolar")
    end

    it "returns null when passed a null string" do
      string = GBTiles::DataType.string(nil)
      expect(string).to eql(nil)
    end
  end

  context "of defined length" do
    it "ignores a later string terminator" do
      string = GBTiles::DataType.string("123456789\00123456789", 5)
      expect(string).to eql("12345")
    end

    it "accepts an early string terminator" do
      string = GBTiles::DataType.string("He\0llo", 5)
      expect(string).to eql("He")
    end

    it "returns null when passed a null string" do
      string = GBTiles::DataType.string(nil, 10)
      expect(string).to eql(nil)
    end
  end
end

RSpec.describe GBTiles::DataType, "#string!" do
  it "strips the character using the dangerous method" do
    string = "\x47\x42\x4f\x30\x01\x00\x00\x00\x78\x00\x00\x00\x47\x61\x6d\x65".b
    initial_length = string.length
    GBTiles::DataType.string!(string, 3)
    expect(string.length).to eql(initial_length - 3)
  end
end
