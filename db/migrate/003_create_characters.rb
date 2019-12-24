class CreateCharacters < ActiveRecord::Migration[5.2]

    def change
      create_table :characters do |t|
        t.string :name
        t.integer :health
        t.integer :mana
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