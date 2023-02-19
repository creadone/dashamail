# frozen_string_literal: true

module DashaMail
  class Response
    def initialize(answer)
      @answer = answer
    end

    def success?
      @answer.code.to_i == 200
    end

    def code
      @answer.code
    end

    def body
      @answer.body
    end

    def raw
      @answer
    end
  end
end
