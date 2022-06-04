# frozen_string_literal: true

class Dealer < Person
  attr_reader :name
  attr_accessor :open_card

  def initialize
    @name = 'Дилер'
    @open_card = false
    super
  end

  def move?
    return false if @cards.size == 3
    @sum <= 17
  end

  def new_game
    @open_card = false
    super
  end
end
