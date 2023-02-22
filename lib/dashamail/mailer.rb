# frozen_string_literal: true

module DashaMail
  class Mailer
    def initialize
      @composer = Composer.new
    end

    def send
      message = @composer.call
      pp message
      Request.new.send(message)
    end

    def method_missing(method, *args)
      @composer.send(method, *args)
    end
  end
end
