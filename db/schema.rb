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

ActiveRecord::Schema.define(version: 2019_10_22_125955) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admin_users", force: :cascade do |t|
    t.string "name", null: false
    t.string "last_name", null: false
    t.string "email", null: false
    t.string "phone"
    t.string "address"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_admin_users_on_user_id", unique: true
  end

  create_table "employees", force: :cascade do |t|
    t.string "name", null: false
    t.string "last_name", null: false
    t.string "email", null: false
    t.string "phone"
    t.string "address"
    t.date "start_date"
    t.float "salary"
    t.string "rol"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_employees_on_user_id", unique: true
  end

  create_table "holders", force: :cascade do |t|
    t.string "name", null: false
    t.string "last_name", null: false
    t.string "email", null: false
    t.string "phone"
    t.string "address"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_holders_on_user_id", unique: true
  end

  create_table "invoices", force: :cascade do |t|
    t.bigint "student_id", null: false
    t.integer "year", null: false
    t.integer "month", null: false
    t.decimal "discount", default: "0.0"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["student_id"], name: "index_invoices_on_student_id"
  end

  create_table "items", force: :cascade do |t|
    t.bigint "invoice_id", null: false
    t.bigint "service_id", null: false
    t.decimal "price", default: "0.0"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["invoice_id"], name: "index_items_on_invoice_id"
    t.index ["service_id"], name: "index_items_on_service_id"
  end

  create_table "payments", force: :cascade do |t|
    t.bigint "invoice_id", null: false
    t.datetime "date", null: false
    t.decimal "amount", default: "0.0"
    t.string "payment_method", default: ""
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["invoice_id"], name: "index_payments_on_invoice_id"
  end

  create_table "services", force: :cascade do |t|
    t.string "name", null: false
    t.string "description"
    t.decimal "price", default: "0.0"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "services_students", id: false, force: :cascade do |t|
    t.bigint "service_id"
    t.bigint "student_id"
    t.index ["service_id"], name: "index_services_students_on_service_id"
    t.index ["student_id"], name: "index_services_students_on_student_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "name", null: false
    t.string "last_name", null: false
    t.string "email", null: false
    t.string "phone"
    t.string "address"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "holder_id"
    t.index ["holder_id"], name: "index_students_on_holder_id"
    t.index ["user_id"], name: "index_students_on_user_id", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "admin_users", "users"
  add_foreign_key "employees", "users"
  add_foreign_key "holders", "users"
  add_foreign_key "invoices", "students"
  add_foreign_key "items", "invoices"
  add_foreign_key "items", "services"
  add_foreign_key "payments", "invoices"
  add_foreign_key "students", "holders"
  add_foreign_key "students", "users"
end
