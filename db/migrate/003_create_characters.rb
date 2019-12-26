class CreateCharacters < ActiveRecord::Migration[5.2]
  def change
    create_table :characters do |t|
      t.string :name
      t.integer :level
      t.integer :current_health
      t.integer :max_health
      t.integer :current_mana
      t.integer :experience
      t.integer :max_mana
      t.integer :strength
      t.integer :dexterity
      t.integer :wisdom
      t.integer :intelligence
      t.integer :charisma
      t.belongs_to :game
      t.timestamps
    end
  end
end
