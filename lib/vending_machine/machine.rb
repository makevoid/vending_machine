require_relative "../utils/quiet_logger"

module VendingMachine
  class Machine
    def initialize(logging=true)
      @logger = QuietLogger.new
      log "VendingMachine ready!"
    end
    
    def transaction(&block)
      block.call(Transaction.new)
    end
    
    def balance
      stock.balance
    end
    
    def stock
      @stock ||= Stock.new
    end
    
    def restock!
      @stock = Stock.new
    end
    
    protected
    
    def log(message)
      @logger.logger << "#{message}\n" unless ENV["app_env"] == "test"
    end
  end
end