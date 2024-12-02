class Viaje < ApplicationRecord
  self.table_name = "tbviajes"

  belongs_to :sucursal
  belongs_to :transportista
  belongs_to :user

  has_many :detalles, class_name: "ViajeDetalle", dependent: :destroy
  validates :total_km, numericality: { less_than_or_equal_to: 100 }

  def calculate_payment
    transportista.tarifa_por_km * total_km
  end
end
