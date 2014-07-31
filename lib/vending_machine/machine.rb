require_relative "../utils/quiet_logger"

module VendingMachine
  class Machine
    def initialize(logging=true)
      @logger = QuietLogger.new
      log "VendingMachine ready!"
    end
    
    def transaction(&block)
      @transaction ||= Transaction.new self
      block.call @transaction
      @transaction.resolve
    end
        
    def balance
      stock.balance
    end
    
    def stock
      @stock ||= Stock.new
    end
    
    def restock!
      @stock = Stock.new
      reset_transaction
    end
    
    protected
    
    def reset_transaction
      @transaction = nil
    end
    
    def log(message)
      @logger.logger << "#{message}\n" unless ENV["app_env"] == "test"
    end
  end
end