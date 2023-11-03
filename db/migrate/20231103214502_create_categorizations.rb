class CreateCategorizations < ActiveRecord::Migration[6.1]
  def change
    create_table :categorizations do |t|
      t.references :blog_post, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
