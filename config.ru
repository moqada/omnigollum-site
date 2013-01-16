data_path = File.dirname(__FILE__)
gollum_config = YAML.load(open(data_path + "/gollum.yaml"))
ldap_config = YAML.load(open(data_path + "/ldap.yaml"))

$LOAD_PATH.push(gollum_config['gollum_path'])
$LOAD_PATH.push(gollum_config['omnigollum_path'])

require 'rubygems'
require 'yaml'
require 'gollum'
require 'gollum/frontend/app'
require 'omnigollum'
require 'omniauth-ldap'

Precious::App.set(:gollum_path, gollum_config['base_path'])
Precious::App.set(:wiki_options, {})

options = {
  # OmniAuth::Builder block is passed as a proc
  :providers => Proc.new do
    provider :ldap, ldap_config
  end,
  :dummy_auth => false
}

# :omnigollum options *must* be set before the Omnigollum extension is registered
Precious::App.set(:omnigollum, options)
Precious::App.register Omnigollum::Sinatra

run Precious::App
