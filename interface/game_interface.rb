# frozen_string_literal: true

class GameInterface
  def start
    puts 'Как вас зовут?'
    @player = Player.new(gets.chomp)
    @dealer = Dealer.new
    loop do
      break unless money?

      puts "\nСыграем еще? 1 - да, 0 - нет"
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

  def new_game
    @deck = DeckOfCards.new
    card_distribution
  end

  def card_distribution
    [@dealer, @player].each do |person|
      person.place_bet
      2.times { person.add_card(@deck) }
    end
    display_cards
  end

  def display_cards
    puts 'Диллер:'
    @dealer.show_card { |card| @dealer.open_card ? (print "#{card} ") : (print '* ') }
    puts "\n#{@player.name}:"
    @player.show_card { |card| print "#{card} " }
    puts "\nСумма очков: #{@player.sum}"
  end
end
