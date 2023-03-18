Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get("/", { :controller => "index", :action => "index" })
  get("/forex", { :controller => "index", :action => "forex_first" })
  get("/forex/:one", { :controller => "index", :action => "forex_calc" })


  get("/covid", { :controller => "index", :action => "covid_calc" })

end
