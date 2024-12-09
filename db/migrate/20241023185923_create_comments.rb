
class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.text :content
      t.references :post, foreign_key: true
      t.references :user, foreign_key: true, null: true # Inyección para permitir que user sea opcional

      t.timestamps
    end
  end
end
