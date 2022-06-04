# frozen_string_literal: true

class DeckOfCards
  SUITS = %i[♣️ ♠️ ♥️ ♦️].freeze
  CARDS_VALUES = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'K', 'D', 'V', 'T'].freeze

  attr_reader :deck

  def initialize
    @deck = create_deck.shuffle
  end

  def create_deck
    @deck = []
    CARDS_VALUES.each do |value|
      SUITS.each do |suit|
        @deck << "#{value} #{suit}"
      end
    end
    @deck
  end

  def draw_card
    @deck.delete_at(0)
  end
end
