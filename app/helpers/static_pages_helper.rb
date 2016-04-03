module StaticPagesHelper
  def resource_name
    :contact
  end

  def resource
    @contact ||= Contact.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:contact]
  end


end
