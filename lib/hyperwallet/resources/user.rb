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
        profile_type:,
        email:
      )

        options = {
          programToken: program_token,
          clientUserId: client_user_id,
          profileType: profile_type,
          email: email
        }

        post(user_path, options)
      end

      def update_user(
        id
      )
        options = {}

        patch(user_path(id), options)
      end

      def delete_user(id)
        delete(user_path(id))
      end

      private

      def user_path(id = nil)
        id ? "#{PATH}/#{id}" : PATH
      end
    end
  end
end
