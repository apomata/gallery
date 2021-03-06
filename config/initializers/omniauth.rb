Rails.application.config.middleware.use OmniAuth::Builder do
  #provider :shibboleth, {
  #  :shib_session_id_field     => "Shib-Session-ID",
  #  :shib_application_id_field => "Shib-Application-ID",
  #  :debug                     => false,
  #  :extra_fields => [
  #    :"unscoped-affiliation",
  #    :entitlement
  #  ]
  #}
  provider :shibboleth, {
    :uid_field                 => "uid",
    :name_field                => "displayName",
    :info_fields => {
      :email    => "email",
      #:location => "contactAddress",
      :image    => "photo_url",
      :phone    => "contactPhone"
    }
  }
end