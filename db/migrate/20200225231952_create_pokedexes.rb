# frozen_string_literal: true

class CreatePokedexes < ActiveRecord::Migration[6.0]
  def change
    create_table :pokedexes do |t|
      t.string :name
      t.integer :hp
      t.integer :att
      t.integer :def
      t.string :image

      t.timestamps
    end
  end
end
