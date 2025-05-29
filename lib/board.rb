require 'matrix'
require_relative 'boardcase'

class Board
  attr_accessor :cases

  def initialize
    @cases = {}  # 🔧 correct spelling

    ["A", "B", "C"].each do |row|
      ["1", "2", "3"].each do |col|
        id = "#{row}#{col}"
        @cases[id] = BoardCase.new(id)
      end
    end
  end

  def display
    puts ""
    puts "  1   2   3"
    ["A", "B", "C"].each do |row|
      line = (1..3).map { |col| @cases["#{row}#{col}"].to_s }.join(" | ")
      puts "#{row} #{line}"
      puts "  --+---+--" unless row == "C"
    end
    puts ""
  end

  def play_case(id, symbol)
    if @cases.key?(id)
      if @cases[id].play(symbol)
        true
      else
        puts "⚠️  Case déjà jouée !"
        false
      end
    else
      puts "❌ Case invalide !"
      false
    end
  end

  def victory?(symbol)
    win_combos = [
      ["A1", "A2", "A3"],
      ["B1", "B2", "B3"],
      ["C1", "C2", "C3"],
      ["A1", "B1", "C1"],
      ["A2", "B2", "C2"],
      ["A3", "B3", "C3"],
      ["A1", "B2", "C3"],
      ["A3", "B2", "C1"]
    ]

    win_combos.any? do |combo|
      combo.all? { |pos| @cases[pos].value == symbol }
    end
  end
end
