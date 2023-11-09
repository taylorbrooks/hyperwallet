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
        routing_number:,
        account_number:,
        business_name:,
        address:,
        city:,
        state:,
        postal_code:
      )

        options = {
          profileType: 'BUSINESS',
          transferMethodCountry: 'US',
          transferMethodCurrency: 'USD',
          type: 'BANK_ACCOUNT',
          branchId: routing_number,
          bankAccountId: account_number,
          bankAccountPurpose: 'CHECKING',
          businessName: business_name,
          addressLine1: address,
          city: city,
          stateProvince: state,
          postalCode: postal_code,
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
