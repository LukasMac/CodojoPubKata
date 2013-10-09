require 'rspec'

PINT = 20
HALF_PINT = 10
DRINK = 1
QUAFF = 4
EMPTY = 0

class Vessel
  attr_reader :remaining

  def initialize(volume)
    @remaining = volume
  end
end

class Pitcher < Vessel
  
  def initialize
    super(capacity)
  end

  def capacity
    60
  end
end


class Glass < Vessel

  def initialize
    super(capacity)
  end

  def empty?
    @remaining == EMPTY
  end

  def drink
    @remaining -= DRINK
  end

  def quaff
    @remaining -= QUAFF
  end

  def down_in_one
    @remaining = EMPTY
  end

  def full?
    @remaining == capacity
  end
end

class Pint < Glass
  def capacity
    PINT
  end 
end

class HalfPint < Glass
  def capacity
    HALF_PINT
  end
end
 
describe Pint do
  before(:each) do
    @pint = Pint.new
  end

  it 'should be full when served' do
    @pint.should be_full
  end

  it 'should not be full after drink' do
    @pint.drink
    @pint.should_not be_full
  end

  it 'should be 1 fl. oz. less after drink' do
    @pint.drink
    @pint.remaining.should == 19
  end

  it 'should be 4 fl. oz. less after quaff' do
    @pint.quaff
    @pint.remaining.should == 16
  end

  it 'should be empty after downing in one' do
    @pint.down_in_one
    @pint.should be_empty
  end  
end

describe HalfPint do
  before(:each) do
    @halfPint = HalfPint.new
  end
  
  it 'should be full when served' do
    @halfPint.should be_full
  end

  it 'should be 1 fl. oz. less after drink' do
    @halfPint.drink

    @halfPint.remaining.should == 9
  end

  it 'should be 4 fl. oz. less after quaff' do
    @halfPint.quaff
    @halfPint.remaining.should == 6
  end

  it 'should be empty after downing in one' do
    @halfPint.down_in_one
    @halfPint.should be_empty
  end  
end

describe Pitcher do
  before(:each) do
    @pitcher = Pitcher.new
  end

  it 'should contain 60 oz when bought' do
    @pitcher.remaining.should == 60
  end

end








class Bear
  JUG = 1
end

describe Customer do
  before(:each) do
    @alan = Customer.new
  end

  it 'can pour 1 pint from a new jug to an empty glass' do
    @jug = @alan.buy(Bar::JUG)
    @alan.pourBeer(@jug, @glass)

  end
end


