# frozen_string_literal: true

# Load gems
require 'dotenv/load'
require 'nylas'

# Initialize Nylas client
nylas = Nylas::Client.new(
  api_key: ENV['NYLAS_API_KEY'],
  api_uri: ENV['NYLAS_API_URI']
)

# Request Body
request_body = {
  trigger_types: [Nylas::WebhookTrigger::MESSAGE_CREATED],
  # In the format https://YOURSERVER.COM/webhook
  webhook_url: os.environ.get("WEBHOOK_URL"),
  description: 'My first webhook',
  notification_email_address: [ENV['GRANT_ID']]
}

webhooks, = nylas.webhooks.create(request_body: request_body)
puts webhooks
