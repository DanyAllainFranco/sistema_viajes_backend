class CreateSucursals < ActiveRecord::Migration[8.0]
  def change
    create_table :sucursals do |t|
      t.string :sucu_nombre
      t.string :sucu_direccion

      t.timestamps
    end
  end
end
