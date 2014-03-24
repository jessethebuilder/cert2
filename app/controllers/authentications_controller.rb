class AuthenticationsController < ApplicationController
  #before_action :set_authentication, only: [:show, :edit, :update, :destroy]

  def facebook_callback
    h = env["omniauth.auth"]
    u = User.parse_omniauth(h, current_user)
    if u.save!
      sign_in(:user, u)
    else
      raise NotImplementedError
    end
  end

  def delete_fb_session
    session.delete("fb_expiry")
    session.delete("fb_access_token")
  end

 private
 # Use callbacks to share common setup or constraints between actions.
 def set_authentication
   @authentication = Authentication.find(params[:id])
 end
  # Never trust parameters from the scary internet, only allow the white list through.
 def authentication_params
   params.require(:authentications).permit(:name, :description)
 end
end
