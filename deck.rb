class Deck < Array
  attr_reader :deck

  def initialize(initial)
    @deck = initial.shuffle
  end

  def deal(count, hands)
    raise "Not enough cards to deal #{count} to each player." unless @deck.length >= (hands.length * count)
    count.times do
      hands.each{|hand| hand.draw }
    end

  end
end

class Hand < Array
  attr_accessor :hand
  attr_reader :deck

  def initialize(deck)
    @deck = deck
    @hand = []
  end

  def draw
    raise "Deck is empty" unless @deck.length > 0
    @hand << @deck.pop
  end

end

# Initial hand should be 4 cards
initial_deck = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]

deck = Deck.new(initial_deck)
p1 = Hand.new(deck)
p2 = Hand.new(deck)

deck.deal(4, [p1, p2])

