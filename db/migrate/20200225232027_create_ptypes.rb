# frozen_string_literal: true

class CreatePtypes < ActiveRecord::Migration[6.0]
  def change
    create_table :ptypes do |t|
      t.string :poke_type
      t.string :chinese
      t.string :japanese

      t.timestamps
    end
  end
end
