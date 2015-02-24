class CreateKeywords < ActiveRecord::Migration
  def change
    unless ActiveRecord::Base.connection.table_exists? 'keywords'
      create_table :keywords do |t|
        t.string :keyword, limit: 1000
        t.string :translit, limit: 1000
        t.integer :processed, limit: 1
        t.string :published

        t.timestamps
      end
    end
  end
end