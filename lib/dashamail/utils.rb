# frozen_string_literal: true

require 'base64'
require 'mime-types'

module DashaMail
  class Utils
    def self.build_attachment(file_path)
      raise StandardError, 'File not exist' unless File.exist?(file_path)

      file_name = File.basename(file_path)
      file_body = File.open(file_path, 'rb') do |io|
        Base64.strict_encode64(io.read)
      end
      { name: file_name, filebody: file_body }
    end

    def self.build_inline(file_path, cid)
      raise StandardError, 'File not exist' unless File.exist?(file_path)

      file_name = File.basename(file_path)
      mime_type = MIME::Types.type_for(file_path)[0].to_s
      file_body = File.open(file_path, 'rb') do |io|
        Base64.strict_encode64(io.read)
      end
      {
        mime_type: mime_type,
        filename: file_name,
        body: file_body,
        cid: cid
      }
    end
  end
end
