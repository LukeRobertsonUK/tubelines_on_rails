Tubelines::Application.routes.draw do

  get '/home', to: "home#home"

  root to: 'home#home'

  post '/calculator', to: "home#calculate"


end
