# frozen_string_literal: true

require 'uri'
require 'json'
require 'net/http'

module DashaMail
  class HTTP
    VERBS = {
      get: Net::HTTP::Get,
      post: Net::HTTP::Post
    }.freeze

    def initialize(options = {})
      @config = DashaMail.config
      @credentials = {
        end_point: @config.end_point,
        api_key: @config.api_key
      }.merge!(options)
    end

    def base_headers(options = {})
      @headers = {
        'User-Agent' => "DashaMail(Ruby)/#{DashaMail::VERSION}",
        'Content-Type' => 'application/json'
      }.merge!(options)
    end

    def get(path, options = {})
      execute(path, :get, options)
    end

    def post(path, options = {})
      execute(path, :post, options)
    end

    private

    def execute(path, method, options = {})
      uri_params = add_param(@credentials[:end_point], 'method', path)
      uri = URI(uri_params)

      req = VERBS[method].new(uri)

      options.merge!(api_key: @credentials[:api_key])
      options.transform_keys!(&:to_s)

      headers = base_headers
      headers.each { |k, v| req[k] = v }
      req.body = (options || {}).to_json

      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = (uri.scheme == 'https')
      http.set_debug_output($stdout) if @config.http_debug

      http.request(req)
    end

    def add_param(url, param_name, param_value)
      uri = URI(url)
      params = URI.decode_www_form(uri.query || '') << [param_name, param_value]
      uri.query = URI.encode_www_form(params)
      uri.to_s
    end
  end
end
