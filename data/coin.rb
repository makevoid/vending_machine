class Coin
  attr_reader :label, :value
  
  def initialize(label)
    @label = label
    @value = self.values[label]
  end
  
  def self.values
    {
      "1p"  => 1,
      "2p"  => 2,
      "5p"  => 5,
      "10p" => 10,
      "20p" => 20,
      "50p" => 50,
      "£1"  => 1_00,
      "£2"  => 2_00,
    }
  end
end