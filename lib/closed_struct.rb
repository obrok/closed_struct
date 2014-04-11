require "closed_struct/version"

class ClosedStruct
  def initialize(contents)
    @contents = contents

    singleton_class = (class << self; self; end)
    @contents.each do |key, value|
      singleton_class.send(:define_method, key) { value }
    end
  end

  def to_h
    @contents.to_h
  end

  def hash
    @contents.hash
  end

  def ==(other)
    (other.class == self.class) && (other.to_h == self.to_h)
  end
  alias_method :eql?, :==
end
