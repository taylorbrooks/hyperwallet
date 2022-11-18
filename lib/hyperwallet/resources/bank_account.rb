module Hyperwallet
  class Client
    module BankAccount
      PATH = 'bank-accounts'.freeze

      def list_bank_accounts(user_token, options = {})
        get(bank_account_path(user_token), options)
      end

      def find_bank_account(user_token, id)
        get(bank_account_path(user_token, id))
      end

      def create_bank_account(
        user_token,
        profile_type: 'BUSINESS',
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
          programToken: program_token,
          transferMethodCountry: 'US',
          transferMethodCurrency: 'USD',
          type: 'BANK_ACCOUNT',
          bankAccountPurpose: 'CHECKING',
          country: 'US'
        }

        post(bank_account_path(user_token), options)
      end

      private

      def bank_account_path(user_token, id = nil)
        root_path = "users/#{user_token}/#{PATH}"
        id ? "#{root_path}/#{id}" : root_path
      end
    end
  end
end
