# encoding: utf-8
require "logstash/outputs/base"
require "logstash/namespace"
require 'socket'
require 'json'

class LogStash::Outputs::Sensu < LogStash::Outputs::Base

  config_name "sensu"
  milestone 2

  config :check, :validate => :string, :required => true
  config :host, :validate => :string, :default => "localhost"
  config :port, :validate => :string, :default => "3030"
  config :status, :validate => :number, :default => 2
  config :handlers, :validator => :array, :default => []
  config :output, :validator => :string, :required => true

  public
  def register
    @sock = UDPSocket.new
  end

  public
  def receive(event)
    return unless output?(event)
    begin
      output = {
        :name => event.sprintf(@check),
        :output => event.sprintf(@output),
        :status => @status,
        :handlers => @handlers
      }.to_json
      @sock.send(output, 0, @host, @port)
    end
  end
end
