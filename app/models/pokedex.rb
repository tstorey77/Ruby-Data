# frozen_string_literal: true

class Pokedex < ApplicationRecord
  has_many :types, foreign_key: :poke_type

  validates :name, presence: true
  validates :poke_type, presence: true
end
