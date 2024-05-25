require "singleton"
class DiscordBot
  include Singleton

  def self.run
    run(true)
  end

  def self.message
    message(with_text: "Ping!") do |event|
      event.respond("Pong!")
    end
  end

  private

  def initialize
    Discordrb::Bot.new(token: Rails.application.credentials.dig(:discord, :token))
  end
end
