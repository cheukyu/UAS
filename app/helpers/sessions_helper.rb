module SessionsHelper
	def sign_in(user)
    	remember_token = User.new_remember_token
    	cookies[:remember_token] = { value:   remember_token, expires: 24.hours.from_now.utc }
   		user.update_attribute(:remember_token, User.encrypt(remember_token))
    	self.current_user = user
  end

  def current_user=(user)
  		@current_user = user
  end

  def current_user
    	remember_token = User.encrypt(cookies[:remember_token])
    	@current_user ||= User.find_by(remember_token: remember_token)
  end

  def signed_in?
  		!current_user.nil?
  end

  def sign_out
  		self.current_user = nil
  		cookies.delete(:remember_token)
  end

  def current_user?(user)
      user == current_user
  end

  def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in."
      end
  end

  def daylightsaving?
      current_user.daylight == true
  end

end
