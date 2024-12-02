class CreateTransportista < ActiveRecord::Migration[8.0]
  def change
    create_table :transportista do |t|
      t.string :trans_nombre
      t.string :trans_apellido
      t.decimal :tarifa_por_km

      t.timestamps
    end
  end
end
