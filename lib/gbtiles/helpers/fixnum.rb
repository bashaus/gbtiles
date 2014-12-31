class Fixnum
  def bits range
    len = range.last - range.first + 1
    self >> range.first & ~(-1 >> len << len)
  end
end