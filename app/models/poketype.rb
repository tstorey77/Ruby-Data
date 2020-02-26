# frozen_string_literal: true

class Poketype < ApplicationRecord
  belongs_to :pokedex
  belongs_to :type

  validates :poketype_id, presence: true
  validates :type_id, presence: true
end
