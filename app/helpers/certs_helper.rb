module CertsHelper
  def cert_store
    Store.first
  end

  def current_user_is_admin?
    user_signed_in? || current_user.admin?
  end
end