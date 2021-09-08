module Users
  class Registration < Actionable::Action
    step :validate
    step :save
    step :create_token

    def initialize(
      params: {},
      encoder: Sessions::TokenEncoder
    )
      @params = params
      @encoder = encoder
      @user = nil
    end

    def validate
      @user = User.new(@params)
      #
    end

    def save
    end

    def create_token
    end
  end
end