#!/usr/bin/env ruby

require 'erb'

def open_file(file)
  begin
    file_contents = File.read()
  rescue
    raise "We couldn't open file"
  end

  return file
end

# Commence das ERB!
ovpn_erb = ERB.new(open_file("ovpn.erb"))

# Ready the inputs!
ovpn_conf = open_file()
ca_cert   = open_file()
crt_cert  = open_file()
key_cert  = open_file()

# Fire!
puts ovpn_erb.results
