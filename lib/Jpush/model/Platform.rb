module JPushApiRubyClient
class Platform
  attr_accessor :android,:ios,:winphone;
  def initialize
    @android=false;
    @ios=false;
    @winphone=false;
  end
  def toJSON
    if @android==true&&@ios==true&&@winphone==true
      return 'all';
    else
      array=Array.new
      if @android==true then
        array.push('android')
      end
      if @ios==true then
        array.push('ios')
      end
      if @winphone==true then
        array.push('winphone')
      end
    end
     return array;
  end
  def self.all
  pl=JPushApiRubyClient::Platform.new
  pl.ios=true
  pl.android=true
  pl.winphone=true
    return pl
  end
  def check
    if @android!=true&&@ios!=true&&@winphone!=true
      raise ArgumentError.new('No any deviceType is set.')
    end
  end
end
end