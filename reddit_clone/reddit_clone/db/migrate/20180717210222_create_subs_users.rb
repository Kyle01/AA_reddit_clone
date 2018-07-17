class CreateSubsUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :subs_users do |t|
      t.integer :user_id, null:false
      t.integer :sub_id, null:false
      
      t.timestamps
    end
    add_index :subs_users, :sub_id
    add_index :subs_users, [:user_id, :sub_id], unique:true
  end
end
