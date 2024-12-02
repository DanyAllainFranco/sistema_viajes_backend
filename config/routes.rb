Rails.application.routes.draw do
  get "reportes/viajes"
  get "viajes/create"
  get "colaboradores/asignar_sucursal"
  get "sessions/create"
  # Ruta para login (crear sesión)
  post "/api/login", to: "sessions#create"

  # Rutas para gestionar colaboradores y sucursales
  post "/api/colaboradores/:id/sucursales", to: "colaboradores#asignar_sucursal"

  # Rutas para gestionar viajes
  post "/api/viajes", to: "viajes#create"

  # Ruta para generar el reporte de viajes por transportista
  get "/api/reportes/viajes", to: "reportes#viajes"
end
