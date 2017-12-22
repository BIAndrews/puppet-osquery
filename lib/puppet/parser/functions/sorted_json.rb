require 'json'

def sorted_json(obj)
  case obj
    when String, Fixnum, Float, TrueClass, FalseClass, NilClass
      return obj.to_json
    when Array
      arrayRet = []
      obj.each do |a|
        arrayRet.push(sorted_json(a))
      end
      return "[" << arrayRet.join(',') << "]";
    when Hash
      ret = []
      obj.keys.sort.each do |k|
        ret.push(k.to_json << ":" << sorted_json(obj[k]))
      end
      return "{" << ret.join(",") << "}";
    else
      raise Exception("Unable to handle object of type <%s>" % obj.class.to_s)
  end
end

def pretty_sorted_json(obj, indent=0)
  # calculate the number of spaces to indent
  prefix = " ".*(indent)
  # use a leading space before new structures except on the first
  leading_space = indent == 0 ? '' : ' '
  case obj
    when String, Fixnum, Float, TrueClass, FalseClass, NilClass
      return "#{prefix}#{obj.to_json}"
    when Array
      arrayRet = []
      obj.each do |a|
        arrayRet.push(pretty_sorted_json(a, indent+2))
      end
      return "#{leading_space}[\n" << arrayRet.join(",\n") << "\n#{prefix}]";
    when Hash
      ret = []
      obj.keys.sort.each do |k|
        ret.push( '  ' + prefix + k.to_json << ":" << pretty_sorted_json(obj[k], indent+2))
      end
      return "#{leading_space}{\n" << ret.join(",\n") << "\n#{prefix}}";
    else
      raise Exception("Unable to handle object of type <%s>" % obj.class.to_s)
  end
end

module Puppet::Parser::Functions
  newfunction(:sorted_json, :type => :rvalue, :doc => <<-EOS
This function takes data, outputs making sure the hash keys are sorted

*Examples:*

    sorted_json({'key'=>'value'})

Would return: {'key':'value'}

    sorted_json({'key'=> ['value','another']}, 'pretty')

Would return:
{
  'key': [
    'value',
    'another'
  ]
}
    EOS
  ) do |arguments|
    raise(Puppet::ParseError, "sorted_json(): Wrong number of arguments " +
      "given (#{arguments.size} for 2)") if arguments.size != 2

    input = arguments[0]
    if arguments[1] == 'pretty'
      return pretty_sorted_json(input)
    else
      return sorted_json(input)
    end
  end
end
