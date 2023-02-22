# frozen_string_literal: true

module DashaMail
  class Response
    def initialize(answer)
      @answer = answer
      @body   = JSON.parse(@answer.body)['response']
    end

    def success?
      @body.dig('msg', 'err_code').to_i == 0
    end

    def http_code
      @answer.code
    end

    def transaction_id
      @body.dig('data', 'transaction_id')
    end

    def body
      @body
    end

    def raw
      @answer
    end
  end
end
