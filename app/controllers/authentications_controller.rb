class AuthenticationsController < ApplicationController
  #require 'koala'
  #include FacebookHelper
  #before_action :set_authentication, only: [:show, :edit, :update, :destroy]

  #def facebook_callback
  #  h = env["omniauth.auth"]
  #  u = User.parse_omniauth(h, current_user)
  #  if u.save!
  #    sign_in(:user, u)
  #  else
  #    raise NotImplementedError
  #  end
  #end

  def facebook_auth_callback
    @me = get_facebook_user
    render :nothing => true

  end

  def get_facebook_user
    graph.get_object('me', oauth_token['access_token'])
  end


  def oauth_token
    @oauth_token ||= oauth.get_access_token(oauth_token_url)
  end

  private

  def oauth_token_url
    code = oauth.url_for_oauth_code(:permissions => FB_PERMISSIONS)
    oauth.url_for_access_token(code)
  end


  def oauth
    @oauth ||= Koala::Facebook::OAuth.new(FB_ID, FB_SECRET, 'http://certs-demo.herokuapp.com')
    #@oauth ||= Koala::Facebook::OAuth.new(FB_ID, FB_SECRET)
  end


  def graph
    @graph ||= Koala::Facebook::API.new
  end


  #
  #def delete_fb_session
  #  session.delete("fb_expiry")
  #  session.delete("fb_access_token")
  #end

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
