class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :author_id, null: false
      t.string :text, null: false
      t.references :commentable, polymorphic: true, index: true

      t.timestamps null: false
    end

    add_index :comments, :author_id
  end
end
