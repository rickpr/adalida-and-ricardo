class CreateCarousels < ActiveRecord::Migration[6.0]
  def change
    create_table :carousels do |t|
      t.text :name
      t.text :description

      t.timestamps
    end
  end
end
