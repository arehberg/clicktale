Rails.application.routes.draw do
  match "clicktale/:filename" => "clicktale#show"
end