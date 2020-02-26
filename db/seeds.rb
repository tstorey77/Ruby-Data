# frozen_string_literal: true

require 'json'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# remove tables
Move.destroy_all
Type.destroy_all
Pokedex.destroy_all

# adding Types
types_file = File.read('/mnt/c/Users/Trevor/Desktop/BIT Term 5/FullStack/DataProject/Project/pokemon.json-master/types.json')
pokedex_file = File.read('/mnt/c/Users/Trevor/Desktop/BIT Term 5/FullStack/DataProject/Project/pokemon.json-master/pokedex.json')
moves_file = File.read('/mnt/c/Users/Trevor/Desktop/BIT Term 5/FullStack/DataProject/Project/pokemon.json-master/moves.json')
# items_file = File.read('/mnt/c/Users/Trevor/Desktop/BIT Term 5/FullStack/DataProject/Project/pokemon.json-master/items.json')

types_hash = JSON.parse(types_file)
poke_hash = JSON.parse(pokedex_file)
moves_hash = JSON.parse(moves_file)
# items_hash = JSON.parse(items_file)

types_hash.each do |(key)|
  new_type = Type.create(poke_type: key['english'],
                         chinese: key['chinese'],
                         japanese: key['japanese'])
end

puts Move.inspect
moves_hash.each do |(key)|
  ids = Type.all
  ids.each do |(id)|
    next unless id.poke_type == key['type']

    this_type = Type.where(id: id).first
    puts this_type.inspect
    puts key['type']
    new_move = this_type.moves.create(name: key['ename'],
                                      power: key['power'],
                                      pp: key['pp'])
    if new_move.save
      puts 'inspect: ' + new_move.inspect
    else
      new_move.errors.messages.each do |column, errors|
        errors.each do |error|
          puts "The #{column} property: #{error}"
        end
      end
    end
  end
end

poke_hash.each do |(key)|
  new_poke = Pokedex.create(name: key['name']['english'],
                            hp: key['base']['HP'],
                            att: key['base']['Attack'],
                            def: key['base']['Defense'],
                            image: key['id'])
end

puts Type.count
puts Pokedex.count
puts Poketype.count
puts Move.count
puts Move.last.inspect
puts Pokedex.last.inspect
puts Type.last.inspect
