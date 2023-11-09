module Hyperwallet
  class Client
    module User
      PATH = 'users'.freeze

      def list_users(options = {})
        get(user_path, options)
      end

      def find_user(id)
        get(user_path(id))
      end

      def create_user(
        program_token:,
        client_user_id:,
        email:,
        profile_type: 'BUSINESS',
        business_type: 'NOT_FOR_PROFIT_ORGANIZATION',
        business_name:,
        address:,
        city:,
        state:,
        postal_code:,
        country: 'US'
      )

        options = {
          programToken: program_token,
          clientUserId: client_user_id,
          profileType: profile_type,
          email: email,
          profileType: profile_type,
          businessType: business_type,
          businessName: business_name,
          addressLine1: address,
          city: city,
          stateProvince: state,
          postalCode: postal_code,
          country: country
        }

        post(user_path, options)
      end

      private

      def user_path(id = nil)
        id ? "#{PATH}/#{id}" : PATH
      end
    end
  end
end
