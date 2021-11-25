# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_11_05_173529) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "nodes", force: :cascade do |t|
    t.datetime "import_time"
    t.string "import_id"
    t.string "overlay"
    t.string "error"
    t.boolean "fullNode"
    t.string "country"
    t.float "lat"
    t.float "long"
    t.datetime "lastDiscoveryTime"
    t.datetime "lastCheckTime"
    t.boolean "seen_in_last_hour"
    t.boolean "checked_in_last_hour"
    t.integer "underlays"
    t.string "last_underlay"
    t.string "userAgent"
    t.string "ethereumAddress"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
