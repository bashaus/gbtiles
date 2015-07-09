module GBTiles
  module DataType
    def self.string(src, length = nil)
      if src.nil? then
        return nil
      end

      if !length.nil? then
        string = src.slice(0, length)
      else
        string = src
      end

      string = string.split(/\0/).first
      string = string.unpack("A*")[0]
      string
    end

    def self.string!(src, length = nil)
      if src.nil? then
        return nil
      end

      if !length.nil? then
        string = src.slice!(0, length)
      else 
        string = src
      end

      self.string(string, length)
    end

    # WORD
    # LITTLE ENDIAN
    # 2 BYTES
    def self.word(src)
      src.slice(0, 2).unpack("v*")[0]
    end

    def self.word!(src)
      self.word(src.slice!(0, 2))
    end

    # BYTE
    # 1 BYTE
    def self.byte(src)
      src.slice(0, 1).unpack("C*")[0]
    end

    def self.byte!(src)
      self.byte(src.slice!(0, 1))
    end

    # BOOLEAN
    # 1 BYTE
    def self.boolean(src)
      src.slice!(0, 1).unpack("C")[0].eql? 1
    end

    def self.boolean!(src)
      self.boolean(src.slice!(0, 1))
    end

    # LITTLE ENDIAN
    # 32 BIT INTEGER
    # 4 BYTES
    def self.long(src)
      src.slice(0, 4).unpack("V*")[0]
    end

    def self.long!(src)
      self.long(src.slice!(0, 4))
    end
  end
end
