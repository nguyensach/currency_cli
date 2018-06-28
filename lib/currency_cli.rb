require "currency_cli/version"
require 'net/http'
require 'json'
require 'date'

module CurrencyCli
  def self.exchange(source, currencies)
    url = "http://apilayer.net/api/live?access_key=f428455b332bcd67d51c3c84c90f02e7&currencies=#{source},#{currencies}&source=USD&format=1"
    uri = URI(url)
    response = Net::HTTP.get(uri)
    result = JSON.parse(response)

    source_value = result["quotes"]["USD#{source}"].to_f
    currencies.split(",").each do |currency|
      currency_value = result["quotes"]["USD#{currency}"].to_f/source_value
      puts "#{source}/#{currency} => #{currency_value}"
    end
  end

  def self.history(source, currencies, date)
    url = "http://apilayer.net/api/historical?access_key=f428455b332bcd67d51c3c84c90f02e7&date=#{date}&format=1&currencies=#{source},#{currencies}"
    uri = URI(url)
    response = Net::HTTP.get(uri)
    result = JSON.parse(response)

    source_value = result["quotes"]["USD#{source}"].to_f
    currencies.split(",").each do |currency|
      currency_value = result["quotes"]["USD#{currency}"].to_f/source_value
      puts "#{source}/#{currency} => #{currency_value}"
    end
  end

  def self.history_range(source, currencies, from_date, to_date)
    from = Date.parse(from_date)
    to = Date.parse(to_date)
    for i in from..to do
      puts i
      history(source, currencies, i.to_s)
      puts "===================="
    end
  end
end
