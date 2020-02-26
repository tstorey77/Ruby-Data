# frozen_string_literal: true

class Move < ApplicationRecord
  belongs_to :types, foreign_key: :poke_type

  validates :name, presence: true
  validates :poke_type, presence: true
end
