require_relative "./config/environment.rb"
require 'irb'

d = Players::Human.new("X")
t = Players::Human.new("O")

cp1 = Players::Computer.new("X")
cp2 = Players::Computer.new("O")

g1 = Game.new(d,t)
g2 = Game.new(d,cp1)
g3 = Game.new(cp1,cp2)

IRB.start