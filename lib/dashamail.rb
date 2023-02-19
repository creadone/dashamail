# frozen_string_literal: true

require 'dashamail/version'
require 'dashamail/configuration'
require 'dashamail/utils'
require 'dashamail/http'
require 'dashamail/composer'
require 'dashamail/mailer'
require 'dashamail/response'
require 'dashamail/request'

module DashaMail
  def self.configure
    yield DashaMail::Configuration
  end

  def self.config
    DashaMail::Configuration
  end
end
