# frozen_string_literal: true

class Dealer < Person
  attr_reader :name
  attr_reader :open_card

  def initialize
    @name = 'Дилер'
    @open_card = false
    super
  end

  def move?
    @sum >= 17
  end

  def new_game
    @open_card = false
    super
  end
end
