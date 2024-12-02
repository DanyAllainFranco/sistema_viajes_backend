class CreateViajes < ActiveRecord::Migration[8.0]
  def change
    create_table :viajes do |t|
      t.integer :sucu_id
      t.integer :trans_id
      t.integer :user_user_id
      t.date :viaj_fecha
      t.decimal :total_km
      t.decimal :total_a_pagar

      t.timestamps
    end
  end
end
