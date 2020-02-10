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

ActiveRecord::Schema.define(version: 2020_02_10_175707) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "concepts", force: :cascade do |t|
    t.string "name"
    t.string "cantidad"
    t.string "subtotal"
    t.bigint "quotation_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["quotation_id"], name: "index_concepts_on_quotation_id"
  end

  create_table "conditions", force: :cascade do |t|
    t.text "description"
    t.bigint "quotation_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["quotation_id"], name: "index_conditions_on_quotation_id"
  end

  create_table "days", force: :cascade do |t|
    t.string "fecha"
    t.bigint "quotation_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["quotation_id"], name: "index_days_on_quotation_id"
  end

  create_table "fecha_habils", force: :cascade do |t|
    t.string "fecha"
    t.bigint "quotation_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["quotation_id"], name: "index_fecha_habils_on_quotation_id"
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_type", "sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_type_and_sluggable_id"
  end

  create_table "icons", force: :cascade do |t|
    t.string "name"
    t.bigint "requirement_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["requirement_id"], name: "index_icons_on_requirement_id"
  end

  create_table "phases", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.bigint "quotation_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["quotation_id"], name: "index_phases_on_quotation_id"
  end

  create_table "quotations", force: :cascade do |t|
    t.string "titulo"
    t.string "servicio"
    t.date "fecha"
    t.text "scope"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.string "photo"
    t.string "slug"
    t.index ["slug"], name: "index_quotations_on_slug", unique: true
    t.index ["user_id"], name: "index_quotations_on_user_id"
  end

  create_table "requirements", force: :cascade do |t|
    t.string "name"
    t.string "title"
    t.bigint "quotation_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["quotation_id"], name: "index_requirements_on_quotation_id"
  end

  create_table "sub_requirements", force: :cascade do |t|
    t.string "requerimiento"
    t.bigint "requirement_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["requirement_id"], name: "index_sub_requirements_on_requirement_id"
  end

  create_table "totals", force: :cascade do |t|
    t.integer "subtotal"
    t.bigint "quotation_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["quotation_id"], name: "index_totals_on_quotation_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "admin", default: false, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "concepts", "quotations"
  add_foreign_key "conditions", "quotations"
  add_foreign_key "days", "quotations"
  add_foreign_key "fecha_habils", "quotations"
  add_foreign_key "icons", "requirements"
  add_foreign_key "phases", "quotations"
  add_foreign_key "quotations", "users"
  add_foreign_key "requirements", "quotations"
  add_foreign_key "sub_requirements", "requirements"
  add_foreign_key "totals", "quotations"
end
