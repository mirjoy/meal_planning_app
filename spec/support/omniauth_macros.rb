module OmniauthMacros
  def mock_auth_hash
    OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new({
       provider: "facebook",
       uid: 827670270665,
       info:
        {email: "mirjoy.moser@gmail.com",
         name: "Miriam Joy"},
       credentials:
        {token:
          "CAAUNZB0W6ps8BAK8xf",
         expires_at: 1434834483}
      })
  end
end
