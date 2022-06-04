# frozen_string_literal: true

class GameInterface
  ACTION_OPTIONS = {
    1 => { description: 'Пропустить',     action: ->(context) { context.skip } },
    2 => { description: 'Добавить карту', action: ->(context) { context.add_card } },
    3 => { description: 'Открыть карты',  action: ->(context) { context.open_cards } }
  }.freeze

  WINNER_POINTS = 21

  def start
    puts 'Как вас зовут?'
    @player = Player.new(gets.chomp)
    @dealer = Dealer.new
    loop do
      break unless money?

      puts "\nСыграем? 1 - да, 0 - нет"
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
    options = ACTION_OPTIONS.dup
    loop do
      options.each { |option, value| puts "#{option} - #{value[:description]}" }
      action_number = gets.chomp.to_i
      next unless options[action_number]

      options[action_number][:action].call(self)
      options.delete(action_number)
      break if @dealer.open_card == true

      move_dealer
    end
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
    puts "\nСумма очков: #{@dealer.sum}" if @dealer.open_card
    puts "\n#{@player.name}:"
    @player.show_card { |card| print "#{card} " }
    puts "\nСумма очков: #{@player.sum}"
  end

  def skip
    puts 'Ход перешел к дилеру'
  end

  def move_dealer
    sleep 3
    @dealer.move? ? @dealer.add_card(@deck) : (puts "\nДилер пропускает ход")
    display_cards
  end

  def add_card
    @player.add_card(@deck)
    display_cards
  end

  def open_cards
    @dealer.open_card = true
    display_cards
    puts 'Подсчет очков'
    sleep 3
    pick_winner
  end

  def pick_winner
    if (@dealer.sum == @player.sum) || (@dealer.sum > WINNER_POINTS && @player.sum > WINNER_POINTS)
      puts 'Ничья'
      @player.add_bank(10)
      @dealer.add_bank(10)
    elsif (@dealer.sum + 1..WINNER_POINTS).include?(@player.sum) || @dealer.sum > WINNER_POINTS
      puts 'Вы победили'
      @player.add_bank(20)
    else
      puts 'Вы проиграли'
      @dealer.add_bank(20)
    end
    puts "Банк #{@player.bank}"
  end
end
