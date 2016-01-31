class Admin::Authenticator
  def initialize(admin)
    @admin = admin
  end

  def authenticate(raw_password)
    return false unless @admin
    return :suspended if @admin.suspended?

    return true if (@admin.hashed_password &&
                    BCrypt::Password.new(@admin.hashed_password) == raw_password)
    return false
  end
end
