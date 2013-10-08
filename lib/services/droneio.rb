class Service::Droneio < Service::HttpPost

  default_events :push

  url "https://drone.io"
  logo_url "http://docs.drone.io/img/d.png"

  maintained_by :github => 'sebbu2',
    :twitter => '@sebbu2'

  supported_by :web => 'http://docs.drone.io/contact.html',
    :github => 'drone',
    :email => 'support@drone.io',
    :twitter => '@droneio'

  def receive_push
    url = "https://drone.io/hook?id=github.com%2F#{payload['repository']['owner']['name']}%2F#{payload['repository']['name']}"
    deliver url
  end
end
