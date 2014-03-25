module CertsHelper
  #include FacebookHelper
  include ErrorsHelper
  include HtmlTools

  def cert_store
    Store.first
  end

  def store_name
    cert_store ? cert_store.name : '[Your Store Here]'
  end

  def current_user_is_admin?
    user_signed_in? || current_user.admin?
  end

  #for Devise
  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
end