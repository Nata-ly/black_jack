# frozen_string_literal: true

class Card
  MAX_ACE = 11
  MIN_ACE = 1
  MAX_POINTS = 21
  PICTURES_POINT = 10 # 'K', 'D', 'V'

  attr_reader :name

  def initialize(name)
    @name = name
  end

  def value(points = nil)
    card_nominal = @name.split(' ').first
    return PICTURES_POINT if %w[K D V].include?(card_nominal)

    return card_nominal.to_i unless ace?(card_nominal)

    # points + 11 > 21 ? 1 : 11
    points + MAX_ACE > MAX_POINTS ? MIN_ACE : MAX_ACE
  end

  def ace?(card_nominal)
    card_nominal == 'T'
  end
end
