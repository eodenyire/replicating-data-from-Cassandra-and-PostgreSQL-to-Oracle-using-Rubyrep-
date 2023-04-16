require 'rubyrep'
require 'net/smtp'

# Method to send email notifications
def send_email_notification(message)
  sender_email = "sender_email@example.com"
  sender_password = "sender_password"
  recipient_email = "recipient_email@example.com"
  smtp_server = "smtp.example.com"

  message = <<~MESSAGE_END
  From: Data Replication <#{sender_email}>
  To: Data Engineer <#{recipient_email}>
  Subject: Data Replication Notification

  #{message}
  MESSAGE_END

  Net::SMTP.start(smtp_server, 587, 'example.com', sender_email, sender_password, :login) do |smtp|
    smtp.send_message message, sender_email, recipient_email
  end
end

# Cassandra configuration
Rubyrep.configure do |config|
  config.left = {
    adapter: 'cassandra',
    keyspace: 'keyspace_name',
    servers: ['cassandra_server1', 'cassandra_server2'],
    username: 'ml_user',
    password: 'cassand@google'
  }
  
  config.left.tables = ['Trending_Topics', 'Subscriptions']
  
  config.right = {
    adapter: 'oracle',
    database: 'learning_projects',
    username: 'ml_user',
    password: 'g@@gle2023#',
    host: '10.197.54.90',
    port: 1521
  }
  
  config.replication_direction = :left_to_right

  # Set up email notifications
  config.on_successful_sync do |tables|
    send_email_notification("Data replication was successful for tables: #{tables.join(', ')}")
  end

  config.on_sync_error do |exception, tables|
    send_email_notification("Error occurred during data replication for tables: #{tables.join(', ')}. Error message: #{exception.message}")
  end
end

# PostgreSQL configuration
Rubyrep.configure do |config|
  config.left = {
    adapter: 'postgresql',
    database: 'postgre_data',
    username: 'ml_user',
    password: 'post@google',
    host: '10.195.56.32',
    port: 5432
  }
  
  config.left.tables = ['Products', 'Google Certified Professionals', 'YouTube_Artists']
  
  config.right = {
    adapter: 'oracle',
    database: 'learning_projects',
    username: 'ml_user',
    password: 'g@@gle2023#',
    host: '10.197.54.90',
    port: 1521
  }
  
  config.replication_direction = :left_to_right

  # Set up email notifications
  config.on_successful_sync do |tables|
    send_email_notification("Data replication was successful for tables: #{tables.join(', ')}")
  end

  config.on_sync_error do |exception, tables|
    send_email_notification("Error occurred during data replication for tables: #{tables.join(', ')}. Error message: #{exception.message}")
  end
end
