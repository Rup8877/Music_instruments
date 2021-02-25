# frozen_string_literal: true

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '1075775512070-5b096j6a13fa9plf9rurl1mhb17trrh8.apps.googleusercontent.com',
           'TGHphhBEnmAbLx8dC33NPSMV'
end
