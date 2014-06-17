require 'rubygems'
require 'eventmachine'
require 'socket'

module EMClient
  class TcpClient < EventMachine::Connection
    def notify_readable
      received_data = @io.read_nonblock(4096)
    end

    def receive_data data
      puts data
    end
  end

  def self.run 
    EM.run do
      EventMachine::connect '127.0.0.1', 3000, TcpClient
    end
  end
end

EMClient.run
