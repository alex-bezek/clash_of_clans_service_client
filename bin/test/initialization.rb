require 'yaml'
begin
  api_key_file = YAML.load_file('api_key.yml')
  api_key = api_key_file['api_key']
rescue Errno::ENOENT
  abort(
    'You must include an api_key.yml file with your api key. This is in the git ignore as you should keep it secret'
  )
end

abort('Your api_key.yml must contain the key `api_key`') if api_key.nil?

ClashOfClansServiceClient.initialize(api_key)
