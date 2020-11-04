class CreatePurchaseInfos < ActiveRecord::Migration[6.0]
  def change
    create_table :purchase_infos do |t|
      t.references :purchase_history, null: false, foreign_key: true
      t.string :postal_code,          null: false, default: ""
      t.integer :prefecture_id,       null: false
      t.string :city,                 null: false, default: ""
      t.string :house_num,            null: false, default: ""
      t.string :building_name,                     default: ""
      t.string :phone_num,            null: false, default: ""   
      t.timestamps
    end
  end
end
