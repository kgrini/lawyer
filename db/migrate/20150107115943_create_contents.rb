class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.string :keyword, limit: 1000
      t.string :url, limit: 1000
      t.text :data
      t.string :title, limit: 1000
      t.string :subtitle, limit: 1000
      t.string :links, limit: 1000
      t.string :status
      t.references :category

      t.timestamps null: false
    end
  end
end
