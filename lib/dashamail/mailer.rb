# frozen_string_literal: true

module DashaMail
  class Mailer
    def initialize
      @composer = Composer.new
    end

    def send
      message = @composer.call
      Request.new.send(message)
    end

    def check(transaction_id)
      Request.new.check(transaction_id)
    end

    def method_missing(method, *args)
      @composer.send(method, *args)
    end
  end
end
