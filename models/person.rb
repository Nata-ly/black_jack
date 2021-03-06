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

  def add_bank(value)
    @bank += value
  end

  def place_bet
    @bank -= 10
    new_game
  end

  def new_game
    @cards = []
    @sum = 0
  end

  def show_card(&block)
    @cards.each { |card| block.call(card.name) }
  end

  protected

  attr_writer :sum

  def calculate_sum_points
    @sum = 0
    @cards.each { |card| @sum += card.value(@sum) }
    @sum
  end

end
