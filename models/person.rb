# frozen_string_literal: true

class Person
  attr_reader :bank, :cards, :sum

  def initialize
    @bank = 100
    @cards = []
  end

  def add_card(deck)
    @cards << deck.draw_card
    calculate_sum_points
  end

  def calculate_sum_points
    @sum = 0
    ace = false
    @cards.each do |card|
      @sum += points(card_nominal = card.split(' ').first)
      ace = true if card_nominal == 'T'
    end
    @sum += 10 if ace == true && @sum <= 11
    @sum
  end

  def points(card)
    return 10 if ['K', 'D', 'V'].include?(card)
    return 1 if card == 'T'
    card.to_i
  end
end
