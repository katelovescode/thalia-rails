require "singleton"
class DiscordBot
  # https://stackoverflow.com/a/29836495
  include Singleton

  def discord_bot
    thalia = Discordrb::Bot.new(token: Rails.application.credentials.dig(:discord, :token))
    add_message_listeners(thalia)
    at_exit { thalia.stop }
    thalia.run
  end

  private

  def bot
    DiscordBot.instance.discord_bot
  end

  # helper_method :bot

  def add_message_listeners(bot)
    bot.message(with_text: "Ping!") do |event|
      event.respond("Pong!")
    end
  end
end
