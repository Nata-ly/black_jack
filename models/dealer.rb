# frozen_string_literal: true

class Dealer < Person
  attr_reader :name

  def initialize
    @name = 'Дилер'
    super
  end
end
