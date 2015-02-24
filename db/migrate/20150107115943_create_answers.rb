class CreateAnswers < ActiveRecord::Migration
  def change
    unless ActiveRecord::Base.connection.table_exists? 'answers'
      create_table :answers do |t|
        t.integer :question_id
        t.integer :user_id
        t.text :body

        t.timestamps null: false
      end
    end
  end
end
