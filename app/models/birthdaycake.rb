class Birthdaycake < ApplicationRecord
  after_create -> { Rails.logger.info("Congratulations th callback run") }
end
    