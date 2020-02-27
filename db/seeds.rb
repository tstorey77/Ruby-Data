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
Poketype.destroy_all
Move.destroy_all
Ptype.destroy_all
Pokedex.destroy_all

# files
types_file = File.read('/mnt/c/Users/Trevor/Desktop/BIT Term 5/FullStack/DataProject/Project/pokemon.json-master/types.json')
pokedex_file = File.read('/mnt/c/Users/Trevor/Desktop/BIT Term 5/FullStack/DataProject/Project/pokemon.json-master/pokedex.json')
moves_file = File.read('/mnt/c/Users/Trevor/Desktop/BIT Term 5/FullStack/DataProject/Project/pokemon.json-master/moves.json')
# items_file = File.read('/mnt/c/Users/Trevor/Desktop/BIT Term 5/FullStack/DataProject/Project/pokemon.json-master/items.json')

# parse
types_hash = JSON.parse(types_file)
poke_hash = JSON.parse(pokedex_file)
moves_hash = JSON.parse(moves_file)
# items_hash = JSON.parse(items_file)

# Load into Types table
puts 'Start ptype'
types_hash.each do |(key)|
  new_type = Ptype.create(poke_type: key['english'],
                          chinese: key['chinese'],
                          japanese: key['japanese'])
end
puts 'done types starting moves'
# puts Move.inspect
# Load into Moves table with FK from Types
moves_hash.each do |(key)|
  ids = Ptype.all
  ids.each do |(id)|
    next unless id.poke_type == key['type']

    this_type = Ptype.where(id: id).first
    # puts this_type.inspect
    # puts key['type']
    new_move = this_type.moves.create(name: key['ename'],
                                      power: key['power'],
                                      pp: key['pp'])
    if new_move.save
      # puts 'inspect: ' + new_move.inspect
    else
      new_move.errors.messages.each do |column, errors|
        errors.each do |error|
          puts "The #{column} property: #{error}"
        end
      end
    end
  end
end
puts 'Done move, starting pokedex'
# Load into pokedex table
poke_hash.each do |(key)|
  new_poke = Pokedex.create(name: key['name']['english'],
                            hp: key['base']['HP'],
                            att: key['base']['Attack'],
                            def: key['base']['Defense'],
                            image: key['id'])
  puts new_poke.inspect
end
puts 'Done pokedex startomg poketype'

# doing it the Hogwarts way
# grab all pokemon
poke_hash.each do |(poke)|
  # right now its adding all of the ptypes to each pokemon
  # see if we can check the poke type and check the ptype name and match them
  # get the name of the poke we are currently in
  poke_name = poke['name']['english']
  # get the pokemon object
  current_poke = Pokedex.where(name: poke_name)
  real_poke = current_poke.first

  if poke['type'].length > 1
    first = poke['type'][0]
    second = poke['type'][1]
    first_object = Ptype.where(poke_type: first)
    real_first = first_object.first
    second_object = Ptype.where(poke_type: second)
    real_second = second_object.first
    first_poketype = Poketype.create(pokedex: real_poke, ptype: real_first)
    second_poketype = Poketype.create(pokedex: real_poke, ptype: real_second)
    puts 'Two types '
    puts first_poketype.inspect
    puts second_poketype.inspect
  else
    first = poke['type'][0]
    object = Ptype.where(poke_type: first)
    real_object = object.first
    poketype_object = Poketype.create(pokedex: real_poke, ptype: real_object)
    puts 'One type'
    puts poketype_object.inspect
  end
end

puts Ptype.count
puts Pokedex.count
puts Poketype.count
puts Move.count

puts Move.last.inspect
puts Pokedex.last.inspect
puts Ptype.last.inspect
puts Poketype.last.inspect
