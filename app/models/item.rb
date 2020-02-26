# frozen_string_literal: true

class Item < ApplicationRecord
  validates :name, presence: true, uniquness: true
end
