# This file is used by Rack-based servers to start the application.

require_relative "config/environment"

DiscordBot.instance.discord_bot
run Rails.application
Rails.application.load_server
