require_relative 'player'
require_relative 'board'

class Game
  attr_accessor :player1, :player2, :board, :current_player

  def initialize
    puts "⭕️ Joueur 1, entre ton nom :"
    print ">> "
    name1 = gets.chomp
    @player1 = Player.new(name1, "O")

    puts "❌ Joueur 2, entre ton nom :"
    print ">> "
    name2 = gets.chomp
    @player2 = Player.new(name2, "X")

    @board = Board.new
    @current_player = @player1
  end

  def turn
    board.display
    puts "🎯 #{@current_player.name} (#{@current_player.symbol}), choisis une case :"
    print ">> "
    choice = gets.chomp.upcase

    if board.play_case(choice, @current_player.symbol)
      if board.victory?(@current_player.symbol)
        board.display
        puts "🏆 #{@current_player.name} remporte la partie !"
        return :win
      elsif board.cases.values.all? { |c| c.value != " " }
        board.display
        puts "🤝 Match nul !"
        return :draw
      else
        switch_player
        return :continue
      end
    else
      puts "⚠️ Choix invalide, réessaie."
      return :retry
    end
  end

  def switch_player
    @current_player = (@current_player == @player1) ? @player2 : @player1
  end

  def play
    puts "🎮 Début de la partie !"
    loop do
      result = turn
      break if result == :win || result == :draw
    end
  end
end
