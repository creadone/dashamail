# frozen_string_literal: true

module DashaMail
  class Composer
    def initialize
      @config = DashaMail.config
      @container = {
        to: nil,
        from_name: @config.from_name,
        from_email: @config.from_email,
        ignore_delivery_policy: @config.ignore_delivery_policy,
        no_track_clicks: @config.no_track_clicks,
        no_track_opens: @config.no_track_opens
      }
    end

    def to=(to)
      @container[:to] = to
    end

    def cc=(cc)
      @container[:cc] = cc
    end

    def bcc=(bcc)
      @container[:bcc] = bcc
    end

    def from_email=(from_email)
      @container[:from_email] = from_email
    end

    def from_name=(from_name)
      @container[:from_name] = from_name
    end

    def subject=(subject)
      @container[:subject] = subject
    end

    def message=(message)
      @container[:message] = message
    end

    def plain_text=(plain_text)
      @container[:plain_text] = plain_text
    end

    def message_id=(message_id)
      @container[:message_id] = message_id
    end

    def delivery_time=(delivery_time)
      @container[:delivery_time] = delivery_time
    end

    def replace=(replace)
      @container[:replace] = replace
    end

    def domain=(domain)
      @container[:domain] = domain
    end

    def headers=(headers)
      @container[:headers] = headers
    end

    def template_data=(template_data)
      @container[:template_data] = template_data
    end

    def add_attachment(file_path)
      @container[:attachments] = [] unless @container.key?(:attachments)
      @container[:attachments].push Utils.build_attachment(file_path)
    end

    def add_inline(file_path, cid)
      @container[:inline] = [] unless @container.key?(:inline)
      @container[:inline].push Utils.build_inline(file_path, cid)
    end

    def no_track_opens=(no_track_opens)
      @container[:no_track_opens] = no_track_opens
    end

    def no_track_clicks=(no_track_clicks)
      @container[:no_track_clicks] = no_track_clicks
    end

    def ignore_delivery_policy=(ignore_delivery_policy)
      @container[:ignore_delivery_policy] = ignore_delivery_policy
    end

    def call
      @container
    end
  end
end
