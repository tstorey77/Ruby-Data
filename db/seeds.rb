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
Type.destroy_all
Item.destroy_all

# adding Types
types_file = File.read('/mnt/c/Users/Trevor/Desktop/BIT Term 5/FullStack/DataProject/Project/pokemon.json-master/types.json')
pokedex_file = File.read('/mnt/c/Users/Trevor/Desktop/BIT Term 5/FullStack/DataProject/Project/pokemon.json-master/pokedex.json')
moves_file = File.read('/mnt/c/Users/Trevor/Desktop/BIT Term 5/FullStack/DataProject/Project/pokemon.json-master/moves.json')
items_file = File.read('/mnt/c/Users/Trevor/Desktop/BIT Term 5/FullStack/DataProject/Project/pokemon.json-master/items.json')

types_hash = JSON.parse(types_file)
poke_hash = JSON.parse(pokedex_file)
moves_hash = JSON.parse(moves_file)
items_hash = JSON.parse(items_file)

item = Item.create(name: 'Test')

types_hash.each do |(key)|
  new_type = Type.create(poke_type: key['english'],
                         chinese: key['chinese'],
                         japanese: key['japanese'])
  puts new_type.inspect
end

poke_hash.each do |(key)|
  new_poke = Pokedex.create(name: key['name'],
                            hp: key['base']['HP'],
                            att: key['base']['Attack'],
                            def: key['base']['Defense'],
                            image: key['id'])
  puts new_poke.inspect
end

puts Type.count
puts Item.count
puts Pokedex.count
