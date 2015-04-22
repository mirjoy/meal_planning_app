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
          "CAAUNZB0W6ps8BAK8xfgeczNuGnjwPIETAeHpGCN23l5hn1KAlZCUGlFtgsihMqn7O4S4RPUUeK2HSUdxTVGaO93loLmkZBjhz4AhSZBQatdrqpLVyHuhf9DxQ2HYLWjDdneydNuzA6gqsbZACxAZAa60sGe38hkZAoOmhpb1RRdoUgJw78ZCUyfbNgtBSieWpc228dKFIMfCR67tAxeZCfw4g",
         expires_at: 1434834483}
      })
  end
end
