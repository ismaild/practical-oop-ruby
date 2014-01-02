class ObscuringReferences
  attr_reader :data
  def initialize(data)
    @data = data
  end

  def diameters
    # 0 is rim, 1 is tire
    data.collect {|cell| cell[0] + (cell[1] * 2)}
  end
  # ... many other methods that index into the array
end

data = [[622, 20], [622, 23], [559, 30], [559, 40]]

puts ObscuringReferences.new(data).diameters
