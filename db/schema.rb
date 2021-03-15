ActiveRecord::Schema.define(version: 2021_03_15_133348) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "pictures", force: :cascade do |t|
    t.text "content"
    t.text "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
