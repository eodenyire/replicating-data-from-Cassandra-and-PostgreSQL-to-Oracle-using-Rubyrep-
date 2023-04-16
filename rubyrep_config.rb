require 'rubyrep'

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
end
