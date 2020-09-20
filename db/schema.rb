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

ActiveRecord::Schema.define(version: 2020_09_20_160912) do

  create_table "block_templates", force: :cascade do |t|
    t.integer "workout_template_id"
    t.integer "exercise_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["exercise_id"], name: "index_block_templates_on_exercise_id"
    t.index ["workout_template_id"], name: "index_block_templates_on_workout_template_id"
  end

  create_table "blocks", force: :cascade do |t|
    t.integer "workout_id"
    t.integer "exercise_id"
    t.integer "block_template_id"
    t.datetime "start"
    t.datetime "end"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["block_template_id"], name: "index_blocks_on_block_template_id"
    t.index ["exercise_id"], name: "index_blocks_on_exercise_id"
    t.index ["workout_id"], name: "index_blocks_on_workout_id"
  end

  create_table "cycle_templates", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "hide_completed", default: false
  end

  create_table "cycles", force: :cascade do |t|
    t.string "name"
    t.integer "cycle_template_id"
    t.datetime "start"
    t.datetime "end"
    t.string "references"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cycle_template_id"], name: "index_cycles_on_cycle_template_id"
  end

  create_table "exercises", force: :cascade do |t|
    t.string "name"
    t.integer "reference_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["reference_id"], name: "index_exercises_on_reference_id"
  end

  create_table "references", force: :cascade do |t|
    t.string "name"
    t.integer "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "round_templates", force: :cascade do |t|
    t.integer "block_template_id"
    t.string "reps"
    t.integer "sets"
    t.float "percent"
    t.integer "weight"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["block_template_id"], name: "index_round_templates_on_block_template_id"
  end

  create_table "rounds", force: :cascade do |t|
    t.integer "block_id"
    t.string "reps"
    t.integer "sets"
    t.integer "weight"
    t.integer "round_template_id"
    t.datetime "start"
    t.datetime "end"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "work_interval"
    t.integer "rest_interval"
    t.index ["block_id"], name: "index_rounds_on_block_id"
    t.index ["round_template_id"], name: "index_rounds_on_round_template_id"
  end

  create_table "versions", force: :cascade do |t|
    t.string "item_type", null: false
    t.integer "item_id", limit: 8, null: false
    t.string "event", null: false
    t.string "whodunnit"
    t.text "object", limit: 1073741823
    t.datetime "created_at"
    t.text "object_changes", limit: 1073741823
    t.index ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id"
  end

  create_table "workout_templates", force: :cascade do |t|
    t.string "name"
    t.integer "cycle_template_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "order"
    t.index ["cycle_template_id"], name: "index_workout_templates_on_cycle_template_id"
  end

  create_table "workouts", force: :cascade do |t|
    t.string "name"
    t.integer "cycle_id"
    t.integer "workout_template_id"
    t.datetime "start"
    t.datetime "end"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "timed_blocks", default: false
    t.index ["cycle_id"], name: "index_workouts_on_cycle_id"
    t.index ["workout_template_id"], name: "index_workouts_on_workout_template_id"
  end

end
