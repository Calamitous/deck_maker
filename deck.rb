class Deck < Array
  attr_accessor :hand
  attr_reader :deck

  def initialize(initial, hand_size)
    @deck = INITAL_DECK.shuffle
    @hand = []

    hand_size.times { self.draw }
  end

  def draw
    raise "Ooops" unless @deck.length > 0
    @hand << @deck.pop
  end

end

INITAL_DECK = [1, 2, 3, 4, 5, 6, 7, 8]

# Initial hand should be 4 cards
deck = Deck.new(INITAL_DECK, 4)

