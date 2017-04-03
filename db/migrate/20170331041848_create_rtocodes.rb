class CreateRtocodes < ActiveRecord::Migration[5.0]
  def change
    create_table :rtocodes do |t|
      t.integer :code
      t.string :office
      t.string :district

      t.timestamps
    end
  end
end
