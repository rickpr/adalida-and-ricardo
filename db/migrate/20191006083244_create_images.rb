class CreateImages < ActiveRecord::Migration[6.0]
  def change
    create_table :images do |t|
      t.text :name
      t.text :description
      t.text :alt_text
      t.references :container, polymorphic: true, null: false

      t.timestamps
    end
  end
end
