class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name,                null: false, default: "" 
      t.integer :category_id,        null: false
      t.integer :price,              null: false, default: ""
      t.references :user,            foreign_key: true
      t.text :description,           null: false, default: ""
      
      t.timestamps

| category_id     | integer    | null: false |
| condition_id    | integer    | null: false |
| postage_id      | integer    | null: false |
| prefecture_id   | integer    | null: false |
| shipping_day_id | integer    | null: false |

    end
  end
end
