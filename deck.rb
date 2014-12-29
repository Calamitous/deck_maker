class Deck < Array
  attr_reader :deck

  def initialize(initial = [])
    @deck = initial.shuffle
    puts "Deck created with #{@deck.size} cards."
  end

  def deal(count, hands)
    raise "Not enough cards to deal #{count} to each player." unless @deck.length >= (hands.length * count)
    count.times { hands.each{|hand| hand.draw(false) } }
  end

  def inspect
    return_value = ""
    self.deck.each_with_index do |card, index|
      return_value << "* #{index}: #{card}\n"
    end
    return_value
  end
end

class Hand < Array
  attr_accessor :hand
  attr_reader :deck
  @@player_count = 1

  def initialize(deck, name = "Player #{@@player_count}")
    @deck = deck.deck
    @hand = []
    @name = name
    @@player_count += 1
  end

  def draw(show_following = true)
    raise "Deck is empty" unless @deck.length > 0
    @hand << @deck.pop
    puts self.inspect if show_following
  end

  def play(card, show_following = true)
    raise 'You can\'t play or discard a card you don\'t have' unless @hand[card]
    @hand.slice!(card)
    puts self.inspect if show_following
  end

  def play_and_draw(card)
    play(card, false)
    draw
  end

  def inspect
    return_value = "#{@name}\n"
    self.hand.each_with_index do |card, index|
      return_value << "  - #{index}: #{card}\n"
    end
    return_value
  end
end

@initial_deck = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]

@deck = Deck.new(@initial_deck)
@p1 = Hand.new(@deck)
@p2 = Hand.new(@deck)

@deck.deal(4, [@p1, @p2])

