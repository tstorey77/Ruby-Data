# frozen_string_literal: true

class CreateMoves < ActiveRecord::Migration[6.0]
  def change
    create_table :moves do |t|
      t.string :name
      t.integer :power
      t.integer :pp
      t.references :ptype, null: false, foreign_key: true

      t.timestamps
    end
  end
end
