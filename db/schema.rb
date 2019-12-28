# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 8) do

  create_table "characters", force: :cascade do |t|
    t.string "name"
    t.integer "level"
    t.integer "current_health"
    t.integer "max_health"
    t.integer "current_mana"
    t.integer "experience"
    t.integer "max_mana"
    t.integer "strength"
    t.integer "dexterity"
    t.integer "wisdom"
    t.integer "constitution"
    t.integer "intelligence"
    t.integer "charisma"
    t.integer "game_id"
    t.integer "zone_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_characters_on_game_id"
    t.index ["zone_id"], name: "index_characters_on_zone_id"
  end

  create_table "encounters", force: :cascade do |t|
    t.integer "character_id"
    t.integer "monster_id"
    t.boolean "character_win"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["character_id"], name: "index_encounters_on_character_id"
    t.index ["monster_id"], name: "index_encounters_on_monster_id"
  end

  create_table "games", force: :cascade do |t|
    t.string "name"
    t.integer "user_id"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_games_on_user_id"
  end

  create_table "inventories", force: :cascade do |t|
    t.string "name"
    t.integer "character_id"
    t.integer "monster_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["character_id"], name: "index_inventories_on_character_id"
    t.index ["monster_id"], name: "index_inventories_on_monster_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.integer "level"
    t.string "slot"
    t.integer "inventory_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["inventory_id"], name: "index_items_on_inventory_id"
  end

  create_table "monsters", force: :cascade do |t|
    t.string "name"
    t.integer "level"
    t.integer "current_health"
    t.integer "max_health"
    t.integer "current_mana"
    t.integer "experience"
    t.integer "max_mana"
    t.integer "strength"
    t.integer "dexterity"
    t.integer "wisdom"
    t.integer "constitution"
    t.integer "intelligence"
    t.integer "charisma"
    t.integer "zone_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["zone_id"], name: "index_monsters_on_zone_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "zones", force: :cascade do |t|
    t.string "name"
    t.integer "game_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_zones_on_game_id"
  end

end
