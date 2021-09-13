module Users
  class Registration < Actionable::Action
  step :build
  step :validate
  step :create
    def initialize(params)
      super()
      @_params = params
    end
    
    def build
      @user = User.new @_params
    end
    
    def validate
      fail! :name_invalid, "Name is missing" unless @_params[:name].present?
      fail! :username_invalid, "UserName missing" unless @_params[:username].present?
      fail! :email_invalid, "email is missing" unless @_params[:email].present?
      fail! :password_invalid, "password is missing" unless @_params[:password].present?
      fail! :pasconfirmation_invalid, "password confirmation missing" unless @_params[:password_confirmation].present? 
    end
    
    def create
      result = @user.save
      unless  result
        fail!(
          :invalid,
          @user.errors.full_messages.join(", ")
        ) 
      end
    end
  end
end