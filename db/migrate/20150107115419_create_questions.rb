class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :user_id
      t.integer :keyword_id
      t.text :body
      t.string :region, limit: 1000

      t.timestamps null: false
    end
  end
end
