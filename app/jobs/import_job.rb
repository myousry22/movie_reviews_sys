class ImportJob < ApplicationJob
    queue_as :default
    def perform(model, data)
      model.capitalize.constantize.create(data)
    rescue StandardError => e
      Rails.logger.info("Import #{model} issues")
      Rails.logger.error(message: e)
    end
end