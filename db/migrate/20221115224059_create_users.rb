class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
        t.string :user_name
        t.string :password_digest
        t.string :session_token
        
      t.timestamps
    end
  end
end