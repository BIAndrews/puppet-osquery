module Puppet::Parser::Functions
  newfunction(:hash2json, :type => :rvalue, :doc => <<-EOS
This converts a puppet hash to JSON string.
    EOS
  ) do |arguments|
    require 'json'

    if arguments.size != 1
      raise(Puppet::ParseError, 'hash2json(): requires one and only one argument')
    end
    unless arguments[0].is_a?(Hash)
      raise(Puppet::ParseError, 'hash2json(): requires a hash as argument')
    end

    h = arguments[0]

    return puts JSON.pretty_generate(h)
  end
end
