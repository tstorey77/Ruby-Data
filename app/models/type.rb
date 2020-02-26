# frozen_string_literal: true

class Type < ApplicationRecord
  has_many :pokedexs
  has_many :moves

  validates :poke_type, presence: true, uniqueness: true
end
