Rails.application.routes.draw do
  root "tells_fortune#questions"
  post '/result', to: "tells_fortune#result", as: 'result'
end
