# frozen_string_literal: true

module DashaMail
  class Response
    def initialize(answer)
      @answer = answer
      @body   = JSON.parse(@answer.body)['response']
    end

    def success?
      @body.dig('msg', 'err_code').to_i.zero?
    end

    def http_code
      @answer.code
    end

    def text
      @body.dig('msg', 'text')
    end

    def transaction_id
      @body.dig('data', 'transaction_id')
    end

    def data
      @body['data']
    end

    attr_reader :body

    def raw
      @answer
    end
  end
end
