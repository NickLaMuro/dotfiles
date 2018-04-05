#!/usr/bin/env ruby
#
# Creates a gist on github for the current dir
#
# Does the following:
#   - Initializes a git repo in the current dir (if not already done)
#   - Creates a github api token for mkgist (if it doesn't already exist)
#   - Makes an API call to create the new gist (includes all hidden files)
#   - Adds gist.github.com as origin remote
#   - Force updates the existing git history to what is on gist.github.com

require "pp"
require "json"
require "net/http"
require "io/console"

##### HELPER FUNCTIONS #####

# Blue arrow, white bold msg.  Adapted from homebrew codebase
def ohai msg
  if $stdout.tty?
    puts "\033[34m==>\033[0m \033[1m#{msg}\033[0m"
  else
    puts ""
  end
end

# Get input (show input)
def get_input msg; print msg; gets.chomp; end

# Get input (hide input)
def get_pass msg; print msg; STDIN.noecho(&:gets).chomp.tap { puts }; end

BasicAuthEncorder = Class.new.tap do |encoder|
  encoder.extend Net::HTTPHeader

  def encoder.encode user, pass
    basic_encode user, pass
  end
end

def mkgist_token
  File.join(Dir.home, ".config/mkgist_token")
end

##### GITHUB API FUNCTIONS #####

def github_api_uri
  @github_api_uri ||= URI.parse "https://api.github.com"
end

def github_api
  @github_http ||= Net::HTTP.start github_api_uri.hostname,
                                   github_api_uri.port,
                                   :use_ssl => true
end

def missing_otp_in response
  response.code == "401" &&
    response['x-github-otp'] &&
    response['X-github-otp'].include?("required;")
end

##### MAIN FUNCTIONS #####

def init_git_repo_if_needed
  `git status &> /dev/null`
  if $?.exitstatus == 128
    ohai "Initializing git repo..."
    `git init`
  end
end

def create_mkgist_api_token
  ohai "Creating token (one time only)..."
  user = get_input "Enter your GitHub Username: "
  pass = get_pass  "Enter your GitHub Password (never stored): "

  data = {
    :scopes => ["gist"],
    :note   => "mkgist on #{Socket.gethostname}"
  }.to_json

  headers = {
    "authorization" => BasicAuthEncorder.encode(user, pass)
  }

  response = github_api.request_post "/authorizations", data, headers
  if missing_otp_in response
    headers["x-github-otp"] = get_input "Enter your MFA Token: "
    second_response = github_api.request_post "/authorizations", data, headers
    if second_response.code == '201'
      body = second_response.body
    else
      warn "something when wrong..."
      warn second_response.body
      exit 1
    end
  else
    body = response.body
  end
  JSON.parse(body)["token"]
end

def create_api_token_if_needed
  unless File.exist? mkgist_token
    token = create_mkgist_api_token
    File.write mkgist_token, token
  end
end

init_git_repo_if_needed
create_api_token_if_needed

# Close http connection if needed
github_api.finish if defined? @github_api
