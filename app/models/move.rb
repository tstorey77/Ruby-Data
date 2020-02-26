# frozen_string_literal: true

class Move < ApplicationRecord
  belongs_to :type

  validates :name, presence: true, uniqueness: true
end
