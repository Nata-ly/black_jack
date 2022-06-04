# frozen_string_literal: true

class GameInterface
  def start
    puts 'Как вас зовут?'
    @player = Player.new(gets.chomp)
    @dealer = Dealer.new
    loop do
      break unless money?

      puts 'Сыграем еще? 1 - да, 0 - нет'
      action = gets.chomp
      break if action == '0'

      new_game if action == '1'
    end
  end

  def money?
    if @player.bank < 10
      puts 'У вас нет больше денег )'
      return false
    end
    if @dealer.bank < 10
      puts 'У нас закончились деньги ('
      return false
    end
    true
  end
end
