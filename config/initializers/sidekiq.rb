
require 'sidekiq/web'
# require 'sidekiq-status/web'

Sidekiq.configure_server do |config|
    config.redis = {
      url: "redis://movies_reviews_sys_redis_1:6380/0"
    }
end

Sidekiq.configure_client do |config|
        config.redis = {
          url: "redis://movies_reviews_sys_redis_1:6380/0",
        }
end