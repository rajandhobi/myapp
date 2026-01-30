class UserNameValidator < ActiveModel::Validator
  def validate(record)
    if record.name.present? && record.name.include?("@")
      record.errors.add(:name, "cannot contain @symbol")
    end

    if record.name.present? && record.name.length < 4
      record.errors.add(:name, "cannot add name less than 4")
    end
    
  end
end
