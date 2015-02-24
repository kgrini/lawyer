class CreateUsers < ActiveRecord::Migration
  def change
    unless ActiveRecord::Base.connection.table_exists? 'users'
      create_table :users do |t|
        t.string :username
        t.string :firstname
        t.string :lastname
        t.string :avatar
        t.string :email

        t.timestamps
      end
    end
  end
end