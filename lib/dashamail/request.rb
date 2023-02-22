# frozen_string_literal: true

module DashaMail
  class Request
    def initialize
      @http = DashaMail::HTTP.new
    end

    def send(message)
      answer = @http.post('transactional.send', message)
      Response.new(answer)
    end

    def check(transaction_id)
      answer = @http.get('transactional.check', { transaction_id: transaction_id })
      Response.new(answer)
    end
  end
end
