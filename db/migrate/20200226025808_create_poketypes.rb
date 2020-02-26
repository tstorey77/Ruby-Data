# frozen_string_literal: true

class CreatePoketypes < ActiveRecord::Migration[6.0]
  def change
    create_table :poketypes do |t|
      t.references :pokedex, null: false, foreign_key: true
      t.references :type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
