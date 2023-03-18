class IndexController < ActionController::Base

def index
  render( { :template => "/project_template/index.html.erb"})
end

def forex_first
  @raw_data= open("https://api.exchangerate.host/symbols").read
  @parsed_data = JSON.parse(@raw_data)
  @symbols_hash= @parsed_data.fetch("symbols")

  @array_of_symbols= @symbols_hash.keys
  render( { :template => "/project_template/forex_first.html.erb"})
end

def forex_second
  @raw_data= open("https://api.exchangerate.host/symbols").read
  @parsed_data = JSON.parse(@raw_data)
  @symbols_hash= @parsed_data.fetch("symbols")
  
  @array_of_symbols= @symbols_hash.keys
  render( { :template => "/project_template/forex_second.html.erb"})
end

def forex_result
end

def covid_calc
  render( { :template => "/project_template/covid.html.erb"})
end

end
