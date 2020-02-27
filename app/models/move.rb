# frozen_string_literal: true

class Move < ApplicationRecord
  belongs_to :ptype

  validates :name, presence: true, uniqueness: true
end
