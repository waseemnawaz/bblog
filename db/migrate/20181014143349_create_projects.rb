class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :title
      t.text :content
      t.string :image_url
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
