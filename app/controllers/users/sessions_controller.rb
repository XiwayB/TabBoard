module Api
  module V1
    class Users::SessionsController < Devise::SessionsController
      skip_before_action :verify_signed_out_user

      def create
        user = warden.authenticate!(:scope => :user)
        token = Tiddle.create_and_return_token(user, request)
        render json: { authentication_token: token }
      end

      def destroy
        if current_user && Tiddle.expire_token(current_user, request)
          head :ok
        else
          # Client tried to expire an invalid token
          render json: { error: 'invalid token' }, status: 401
        end
      end

    end
  end
end
