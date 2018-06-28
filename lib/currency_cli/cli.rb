require "thor"
require "currency_cli"

module CurrencyCli
  class CLI < Thor

    desc "exchange source currencies", "exchange from a currency to another"
    def exchange(source, currencies)
      CurrencyCli.exchange(source, currencies)
    end

    desc "history source currencies date", "history of from a currency to another at specific date"
    def history(source, currencies, date)
      CurrencyCli.history(source, currencies, date)
    end

    desc "history_range source currencies from_date to_date", "history range from a currency to another from date to date"
    def history_range(source, currencies, from_date, to_date)
      CurrencyCli.history_range(source, currencies, from_date, to_date)
    end
  end
 end
