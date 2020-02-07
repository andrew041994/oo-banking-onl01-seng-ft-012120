class Transfer
  attr_accessor :sender, :receiver, :amount, :status
    def initialize(sender, receiver, amount = 50 )
      @sender = sender
      @receiver = receiver
      @status = "pending"
      @amount
    end

    def valid?
      if sender.status == "open" && sender.balance > 0 and receiver.status == "open" && receiver.balance > 0
        true
      else
        false
      end
      sender.valid?
      receiver.valid?
    end

    def execute_transaction
      if sender.valid?
          if  sender.balance > @amount && @status =="pending"
            sender.balance = sender.balance - @amount
            receiver.balance = receiver.balance += @amount
              @status = "complete"
            else
              @status = "rejected"
              return "Transaction rejected. Please check your account balance."
            end
          end

    end




end
