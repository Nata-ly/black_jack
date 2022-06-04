# frozen_string_literal: true

class Person
  attr_reader :bank, :cards, :sum

  def initialize
    @bank = 100
    @cards = []
  end

  def add_card(deck)
    @cards << deck.draw_card
  end
end
