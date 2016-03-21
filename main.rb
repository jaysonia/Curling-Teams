require_relative 'Agency.rb'
require_relative 'Curler.rb'

test = Agency.new

puts "Load Curlers and Print:"
test.load_men('men_curlers.txt')
test.load_women('women_curlers.txt')
test.print

puts "\n\nTeams Satisfaction:\n"
test.create_teams
puts test.teams_to_s

puts "\nElite Curlers:"
test.each_curler do |this|
  if this.proficiency ==10
    puts "#{this.name}"
  end
end

puts "\nFirst-Ascent"
test.first_ascent
puts test.teams_to_s