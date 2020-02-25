class CreatePokedexes < ActiveRecord::Migration[6.0]
  def change
    create_table :pokedexes do |t|
      t.string :name
      t.string :type
      t.string :hp
      t.string :def
      t.string :image

      t.timestamps
    end
  end
end
