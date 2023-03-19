class IndexController < ActionController::Base

def index
  render( { :template => "/project_template/index.html.erb"})
end

def forex
  @raw_data= open("https://api.exchangerate.host/symbols").read
  @parsed_data = JSON.parse(@raw_data)
  @symbols_hash= @parsed_data.fetch("symbols")

  @array_of_symbols= @symbols_hash.keys
  render( { :template => "/project_template/forex.html.erb"})
end

def forex_first
  @starting_currency = params.fetch("one")

  @raw_data= open("https://api.exchangerate.host/symbols").read
  @parsed_data = JSON.parse(@raw_data)
  @symbols_hash= @parsed_data.fetch("symbols")
  
  @array_of_symbols= @symbols_hash.keys

  render( { :template => "/project_template/forex_first.html.erb"})
end

def forex_result

  @starting_currency = params.fetch("one")
  @ending_currency = params.fetch("two")

    @raw_data = open("https://api.exchangerate.host/convert?from=#{@starting_currency}&to=#{@ending_currency}").read
    @parsed_data = JSON.parse(@raw_data)
    @info_hash = @parsed_data.fetch("info")
    @info_rate = @info_hash["rate"] 

    render({ :template => "project_template/forex_result.html.erb" })
end


def covid_calc
  render( { :template => "/project_template/covid.html.erb"})
end

end
