Rails.application.routes.draw do
  post '/api/robot/0/orders' => 'robots#create'
end
