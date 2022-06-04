# frozen_string_literal: true

class GameInterface
  def start
    puts 'Как вас зовут?'
    player = Player.new(gets.chomp)
    dealer = Dealer.new
    loop do
      break unless have_money?
      puts 'Сыграем еще? 1 - да, 0 - нет'
      action = gets.chomp
      break if action == '0'
      new_game if action == '1'
    end
  end
end
