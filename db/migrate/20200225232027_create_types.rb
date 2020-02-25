class CreateTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :types do |t|
      t.string :type
      t.string :chinese
      t.string :japanese

      t.timestamps
    end
  end
end
