Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  get("/", { :controller => "places", :action => "index" })

  resources "places" do
    resources "entries", only: [:new, :create]
  end
end
