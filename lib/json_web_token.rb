class JsonWebToken
  SECRET_KEY = "993ea8aba0a321894e7dd959e4deedccae156b97c1f886221cbde41ab63725577602d7a0327c4bf73e30f2cedf278f527357f311fa32bef4a9f0583addb2feae"

  def self.encode(payload, exp = 24.hours.from_now)
    payload[:exp] = exp.to_i
    JWT.encode(payload, SECRET_KEY)
  end

  def self.decode(token)
    decoded = JWT.decode(token, SECRET_KEY)[0]
    HashWithIndifferentAccess.new decoded
  end
end