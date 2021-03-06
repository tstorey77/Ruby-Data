# frozen_string_literal: true

class Poketype < ApplicationRecord
  belongs_to :pokedex
  belongs_to :ptype

  validates :pokedex_id, presence: true, numericality: { only_integer: true }
  validates :ptype_id, presence: true, numericality: { only_integer: true }
end
