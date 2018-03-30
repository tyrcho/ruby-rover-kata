require 'rspec'
require './rover'

describe 'Rover' do
  it 'is initially at x=0' do
    rover = Rover.new
    expect(rover.x).to be 0
  end

  it 'moves forward' do
    rover = Rover.new.execute 'F'
    expect(rover.x).to be 1
  end

  it 'moves forward 3 times' do
    rover = Rover.new.execute 'FFF'
    expect(rover.x).to be 3
  end

  it 'executes empty commands' do
    rover = Rover.new.execute ''
    expect(rover.x).to be 0
  end
  
  it 'moves backwards' do
    rover = Rover.new.execute 'B'
    expect(rover.x).to be -1
  end
  
  it 'moves backwards 2 times' do
    rover = Rover.new.execute 'BB'
    expect(rover.x).to be -2
  end
  
  it 'moves backwards 2 times from initial x=3' do
    rover = Rover.new(x:3).execute 'BB'
    expect(rover.x).to be 1
  end
  
  it 'move B and F' do
    rover = Rover.new.execute 'BF'
    expect(rover.x).to be 0
  end
  
  it 'rejects unknown command' do
    expect {Rover.new.execute 'X'}.to raise_exception
  end

  it 'does not change x on move forward facing N' do
    rover = Rover.new(orientation: :north).execute 'F'
    expect(rover.x).to be 0
  end

  xit 'does move forward facing W' do
    rover = Rover.new(orientation: :west).execute 'F'
    expect(rover.x).to be -1
  end

end
