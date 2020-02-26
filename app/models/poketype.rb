class Poketype < ApplicationRecord
  belongs_to :pokedexs
  belongs_to :types
end
