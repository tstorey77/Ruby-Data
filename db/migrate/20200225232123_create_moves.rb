class CreateMoves < ActiveRecord::Migration[6.0]
  def change
    create_table :moves do |t|
      t.string :name
      t.integer :power
      t.integer :pp
      t.references :poke_type, foreign_key: true

      t.timestamps
    end
  end
end
