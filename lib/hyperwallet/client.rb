require 'faraday'

Dir[File.expand_path('../resources/*.rb', __FILE__)].each { |f| require f }
require File.expand_path('../response/base.rb', __FILE__)
Dir[File.expand_path('../response/*.rb', __FILE__)].each { |f| require f }

module Hyperwallet
  class Client
    include Hyperwallet::Client::BankAccount
    include Hyperwallet::Client::Payment
    include Hyperwallet::Client::User

    attr_reader :url, :username, :password, :logger, :connection, :adapter

    def initialize(url:, username:, password:, logger: true, adapter: Faraday.default_adapter)
      @url      = "#{url}/rest/v4/"
      @username = username
      @password = password
      @logger   = logger
      @adapter  = adapter
    end

    def delete(path, options = {})
      connection.delete(path, options).body
    end

    def get(path, options = {})
      connection.get(path, options).body
    end

    def patch(path, options = {})
      connection.patch(path, options).body
    end

    def post(path, options = {})
      connection.post(path, options).body
    end

    def put(path, options = {})
      connection.put(path, options).body
    end

    private

    def connection
      headers = {
        accept: 'application/json',
        'User-Agent' => "hyperwallet-gem/v#{Hyperwallet::VERSION}"
      }

      client_opts = {
        url: url,
        headers: headers
      }

      Faraday.new(client_opts) do |conn|
        conn.request   :authorization, :basic, username, password
        conn.request   :json
        conn.response  :json
        conn.response  :logger if logger
        conn.response  :hyperwallet_errors
        conn.adapter   adapter
      end
    end
  end
end
