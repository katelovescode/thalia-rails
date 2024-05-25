require "singleton"
class DiscordBot
  # https://stackoverflow.com/a/29836495
  include Singleton

  def discord_bot
    thalia = Discordrb::Bot.new(token: Rails.application.credentials.dig(:discord, :token))
    add_message_listeners(thalia)
    add_slash_commands(thalia)
    at_exit { thalia.stop }
    thalia.run(true)
  end

  private

  def bot
    DiscordBot.instance.discord_bot
  end

  def add_message_listeners(bot)
    bot.message(with_text: "Ping!") do |event|
      event.respond("Pong!")
    end
  end

  def add_slash_commands(bot)
    # Rails.application.credentials.dig(:discord, :server_id)
    bot.register_application_command(:spongecase, "Are you mocking me?", server_id: Rails.application.credentials.dig(:discord, :server_id)) do |cmd|
      cmd.string("message", "Message to spongecase")
      cmd.boolean("with_picture", "Show the mocking sponge?")
    end

    bot.application_command(:spongecase) do |event|
      ops = %i[upcase downcase]
      text = event.options["message"].chars.map { |x| x.__send__(ops.sample) }.join
      event.respond(content: text)

      event.send_message(content: "https://pyxis.nymag.com/v1/imgs/09c/923/65324bb3906b6865f904a72f8f8a908541-16-spongebob-explainer.rsquare.w700.jpg") if event.options["with_picture"]
    end
  end
end
