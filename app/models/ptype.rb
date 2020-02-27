# frozen_string_literal: true

class Ptype < ApplicationRecord
  has_many :poketypes
  has_many :pokedexes, through: :poketypes
  has_many :moves

  validates :poke_type, presence: true, uniqueness: true
end
