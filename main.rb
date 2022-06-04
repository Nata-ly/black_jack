# frozen_string_literal: true

require_relative './models/deck_of_cards'
require_relative './models/person'
require_relative './models/player'
require_relative './models/dealer'
require_relative './interface/game_interface'

GameInterface.new.start
