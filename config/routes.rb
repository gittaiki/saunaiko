Rails.application.routes.draw do
  post 'callback', to: 'line_bots#callback'
end
