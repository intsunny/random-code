#!/usr/bin/env ruby

require 'erb'

if ARGV.length != 4 || ARGV[0] == '-h' || ARGV[0] == '--h'
  puts "Usage:"
  puts "./ovpn-makr.rb ovpn_conf ca_cert crt_cert key_cert > user.ovpn"
  exit 1
end

def open_file(file)
  begin
    file_contents = File.read(file)
  rescue
    raise "We couldn't open file"
  end

  return file_contents
end

ovpn_layout = "<%= ovpn_conf %>
<ca>
<%= ca_cert %>
</ca>
<cert>
<%= crt_cert %>
</cert>
<key>
<%= key_cert %>
</key>"

# Commence das ERB!
ovpn_erb = ERB.new(ovpn_layout, nil, '>')

# Ready the inputs!
ovpn_conf = open_file(ARGV[0])
ca_cert   = open_file(ARGV[1])
crt_cert  = open_file(ARGV[2])
key_cert  = open_file(ARGV[3])

# Fire!
puts ovpn_erb.result
