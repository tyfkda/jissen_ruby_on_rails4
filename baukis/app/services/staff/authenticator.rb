class Staff::Authenticator
  def initialize(staff_member)
    @staff_member = staff_member
  end

  def authenticate(raw_password)
    return false unless @staff_member
    return :suspended if @staff_member.suspended?

    return true if (@staff_member.hashed_password &&
                    @staff_member.start_date <= Date.today &&
                    (@staff_member.end_date.nil? || @staff_member.end_date > Date.today) &&
                    BCrypt::Password.new(@staff_member.hashed_password) == raw_password)
    return false
  end
end
