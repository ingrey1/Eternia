class CreateEncounters < ActiveRecord::Migration[5.2]
  def change
    create_table :encounters do |t|
      t.belongs_to :character
      t.belongs_to :monster
      t.character_win :boolean
      t.timestamps
    end
  end
end
