# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_02_26_025808) do

  create_table "moves", force: :cascade do |t|
    t.string "name"
    t.integer "power"
    t.integer "pp"
    t.integer "type_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["type_id"], name: "index_moves_on_type_id"
  end

  create_table "pokedexes", force: :cascade do |t|
    t.string "name"
    t.integer "hp"
    t.integer "att"
    t.integer "def"
    t.string "image"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "poketypes", force: :cascade do |t|
    t.integer "pokedex_id", null: false
    t.integer "type_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["pokedex_id"], name: "index_poketypes_on_pokedex_id"
    t.index ["type_id"], name: "index_poketypes_on_type_id"
  end

  create_table "types", force: :cascade do |t|
    t.string "poke_type"
    t.string "chinese"
    t.string "japanese"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "moves", "types"
  add_foreign_key "poketypes", "pokedexes"
  add_foreign_key "poketypes", "types"
end
