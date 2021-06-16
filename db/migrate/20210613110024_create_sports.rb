class CreateSports < ActiveRecord::Migration[5.2]
  def change
    create_table :sports do |t|
      t.integer :year
      t.integer :month
      t.string :name1
      t.string :name2
      t.string :result

      t.timestamps
    end
  end
end
