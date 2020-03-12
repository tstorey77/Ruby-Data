# frozen_string_literal: true

class Move < ApplicationRecord
  belongs_to :ptype

  paginates_per 9

  validates :name, presence: true, uniqueness: true
end
