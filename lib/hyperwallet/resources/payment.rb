module Hyperwallet
  class Client
    module Payment
      PATH = 'payments'.freeze

      def list_payments(options = {})
        get(payment_path, options)
      end

      def find_payment(id)
        get(payment_path(id))
      end

      def create_payment(
        amount:,
        client_payment_id:,
        destination_token:,
        program_token:,
        currency: 'USD'
      )

        options = {
          amount: amount,
          clientPaymentId: client_payment_id,
          currency: currency,
          destinationToken: destination_token,
          programToken: program_token
        }

        post(payment_path, options)
      end

      private

      def payment_path(id = nil)
        id ? "#{PATH}/#{id}" : PATH
      end
    end
  end
end
