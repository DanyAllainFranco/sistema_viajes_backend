class CreateCollaborators < ActiveRecord::Migration[8.0]
  def change
    create_table :collaborators do |t|
      t.string :cola_nombre
      t.string :cola_apelllido
      t.string :cola_email

      t.timestamps
    end
  end
end
