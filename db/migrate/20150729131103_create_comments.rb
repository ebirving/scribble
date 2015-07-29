class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :author
      t.text :content
      t.datetime :created_at
      t.references :post, index: true, foreign_key: true
    end
  end
end
