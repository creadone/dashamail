# frozen_string_literal: true

module DashaMail
  module Configuration
    def self.api_key
      @api_key
    end

    def self.api_key=(api_key)
      @api_key = api_key
    end

    def self.domain
      @domain
    end

    def self.domain=(domain)
      @domain = domain
    end

    def self.from_email
      @from_email
    end

    def self.from_email=(from_email)
      @from_email = from_email
    end

    def self.no_track_opens
      @no_track_opens
    end

    def self.no_track_opens=(no_track_opens)
      @no_track_opens = no_track_opens
    end

    def self.no_track_clicks
      @no_track_clicks
    end

    def self.no_track_clicks=(no_track_clicks)
      @no_track_clicks = no_track_clicks
    end

    def self.ignore_delivery_policy
      @ignore_delivery_policy
    end

    def self.ignore_delivery_policy=(ignore_delivery_policy)
      @ignore_delivery_policy = ignore_delivery_policy
    end

    def self.end_point
      @end_point
    end

    def self.end_point=(end_point)
      @end_point = end_point
    end

    def self.response_format
      @response_format
    end

    def self.response_format=(response_format)
      @response_format = response_format
    end

    def self.logger
      @logger
    end

    def self.logger=(logger)
      @logger = logger
    end

    def self.http_debug
      @http_debug
    end

    def self.http_debug=(http_debug)
      @http_debug = http_debug
    end

    DEFAULT = {
      end_point: 'https://api.dashamail.ru',
      no_track_opens: true,
      no_track_clicks: true,
      response_format: 'JSON',
      ignore_delivery_policy: false
    }.freeze

    DEFAULT.each do |param, default_value|
      send("#{param}=", default_value)
    end
  end
end
