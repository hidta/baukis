class Administrator < ActiveRecord::Base
  before_validation do
    self.email_for_index = email.downcase if email
  end

  def possword=(row_password)
    if row_password.kind_of?(String)
      self.hashed_password = BCrypt::password.create(row_password)
    elsif row_password.nil?
      self.hashed_password = nil?
    end
  end

end
