require "closed_struct/version"

class ClosedStruct
  def initialize(contents, &block)
    @contents = contents.dup

    singleton_class = (class << self; self; end)
    @contents.each do |key, value|
      singleton_class.send(:define_method, key) { value }
    end

    singleton_class.class_eval(&block) if block_given?
  end

  def to_h
    @contents
  end

  def hash
    @contents.hash
  end

  def ==(other)
    (other.class == self.class) && (other.to_h == self.to_h)
  end
  alias_method :eql?, :==
end
