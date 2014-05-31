class CreateBulletins < ActiveRecord::Migration
  def change
    create_table :bulletins do |t|
      t.string :name
      t.string :attachment
      t.integer :user_id

      t.timestamps
    end
    add_index :bulletins, [:user_id, :created_at]
  end
end
