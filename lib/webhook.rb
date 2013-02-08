require "webhook/version"
require "webhook/configuration"
require 'net/http'

module Webhook

  class << self

    # A Webhook configuration object. Must act like a hash and return sensible
    # values for all Webhook configuration options.
    # @see Webhook::Configuration.
    attr_writer :configuration

    # The configuration object.
    # @see Webhook.configure
    def configuration
      @configuration ||= Configuration.new
    end

    # Call this method to modify defaults in your initializers.
    #
    # @example
    #   Webhook.configure do |config|
    #     config.user_agent = "Webhook"
    #   end
    def configure
      yield(configuration)
    end

    def post(url, form_fields={}, request_headers={}, proxy_settings={})
      headers = {
        "User-Agent" => configuration.user_agent
      }.merge(request_headers)

      uri = URI.parse(url)
      use_ssl = (uri.scheme.downcase == 'https')
      req = Net::HTTP::Post.new(uri.path, headers)
      req.form_data = form_fields

      begin
        http_session = Net::HTTP::Proxy(proxy_settings[:host], proxy_settings[:port]).new(uri.host, uri.port)
        http_session.use_ssl = true if use_ssl

        response = http_session.start { |http|
          http.request(req)
        }
      rescue => e
        raise "Unable to open stream: #{uri.to_s}; \n#{e.to_s}\n#{e.backtrace.join("\n")}"
      end

      return response.code, response.message, response.body
    end
  end
end
