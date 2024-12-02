class CreateViajeDetalles < ActiveRecord::Migration[8.0]
  def change
    create_table :viaje_detalles do |t|
      t.integer :viaj_id
      t.integer :cola_id
      t.decimal :distancia_km

      t.timestamps
    end
  end
end
