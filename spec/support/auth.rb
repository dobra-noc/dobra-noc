module Auth
  def basic_auth(path)
    username = 'admin'
    password = 'adminpassword'
    visit "http://#{username}:#{password}@#{Capybara.current_session.server.host}:#{Capybara.current_session.server.port}#{path}"
  end
end
