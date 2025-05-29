require 'bundler'
Bundler.require

require_relative 'lib/game'

puts "╔" + "═" * 48 + "╗"
puts "║ 🎮  Bienvenue sur 'Morpion Ultime VI' !          ║"
puts "║ ⚔️   Prépare-toi à faire mordre la poussière !   ║"
puts "║ 💥   Bite him !                                  ║"
puts "╚" + "═" * 48 + "╝"

Game.new.play
