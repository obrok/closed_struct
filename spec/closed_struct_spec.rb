require "rubygems"
require "bundler/setup"
require "closed_struct"

describe ClosedStruct do
  it "delegates method calls to hash lookups" do
    expect(ClosedStruct.new(:a => :b).a).to eq(:b)
  end

  it "does not delegate for keys that don't exist in the input" do
    expect { ClosedStruct.new(:a => :b).c }.to raise_error(NoMethodError)
  end

  it "is equal for the same arguments" do
    first = ClosedStruct.new(:a => :b)
    second = ClosedStruct.new(:a => :b)

    expect(first == second).to be_true
    expect(first.eql?(second)).to be_true
    expect(first.hash).to eq(second.hash)
  end

  it "is unequal for different arguments" do
    first = ClosedStruct.new(:a => :b)
    second = ClosedStruct.new(:a => :c)

    expect(first == second).to be_false
    expect(first.eql?(second)).to be_false
    expect(first.hash).not_to eq(second.hash)
  end

  it "allows for definitions of additional methods" do
    object = ClosedStruct.new(:a => :b) do
      def something
        :value
      end
    end

    expect(object.something).to eq(:value)
  end
end
