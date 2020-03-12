# frozen_string_literal: true

class Pokedex < ApplicationRecord
  has_many :poketypes
  has_many :ptypes, through: :poketypes

  paginates_per 24

  validates :name, presence: true, uniqueness: true
end
