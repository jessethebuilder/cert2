require 'spec_helper'

describe 'Facebook Requests' do
  describe 'Before Login' do
    specify 'Facebook login button should be visible to an unsigned_in user' do
      visit new_cert_path
      page.should have_image('social_networking_buttons/fb_sign_in.png')
    end
  end

  describe 'Login' do

  end
end