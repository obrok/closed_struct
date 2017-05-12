require "closed_struct/version"

class ClosedStruct
  def initialize(contents, &block)
    @contents = contents.dup

    singleton_class = (class << self; self; end)
    @contents.each do |key, value|
      raise ArgumentError.new("Cannot define #{key} as it already exists") if respond_to?(key)
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

  def empty?
    @contents.empty?
  end

  def each
    return enum_for(:each) unless block_given?

    @contents.each do |key, value|
      yield key, value
    end
  end
  alias_method :each_pair, :each
end
