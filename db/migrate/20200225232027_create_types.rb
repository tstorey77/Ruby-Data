# frozen_string_literal: true

class CreateTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :types do |t|
      t.string :poke_type
      t.string :chinese
      t.string :japanese

      t.timestamps
    end
  end
end
