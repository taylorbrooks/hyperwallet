module Hyperwallet
  class Client
    module WebhookNotification
      PATH = 'webhook-notifications'.freeze

      def list_webhook_notifications(options = {})
        get(webhook_notifications_path, options)
      end

      private

      def webhook_notifications_path(id = nil)
        id ? "#{PATH}/#{id}" : PATH
      end
    end
  end
end
