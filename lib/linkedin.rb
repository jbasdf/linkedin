# require 'forwardable'
require 'rubygems'
require 'oauth'
require 'roxml'
require 'crack'

require 'cgi'

class Nokogiri::XML::Element
  def has_key?(key)
    self.keys.include?(key)
  end
end

module LinkedIn
  
  class LinkedInError < StandardError
    attr_reader :data

    def initialize(data)
      @data = data
      super
    end
  end

  class RateLimitExceeded < LinkedInError; end
  class Unauthorized      < LinkedInError; end
  class General           < LinkedInError; end

  class Unavailable   < StandardError; end
  class InformLinkedIn < StandardError; end
  class NotFound      < StandardError; end
  
  # config/initializers/linkedin.rb (for instance)
  # 
  # LinkedIn.configure do |config|
  #   config.token = 'consumer_token'
  #   config.secret = 'consumer_secret'
  # end
  # 
  # elsewhere
  #
  # client = LinkedIn::Client.new
  def self.configure
    yield self
      
    LinkedIn.token = token
    LinkedIn.secret = secret
    true
  end
  
  def self.token
    @token
  end
  
  def self.token=(token)
    @token = token
  end
  
  def self.secret
    @secret
  end
  
  def self.secret=(secret)
    @secret = secret
  end
end

#LinkedIn.autoload(:Profile, File.join('linked_in', 'profile'))
#autoload :Recommendation, File.join('linked_in', 'recommendation')
  
directory = File.expand_path(File.dirname(__FILE__))

require File.join(directory, 'linked_in', 'date_of_birth')
require File.join(directory, 'linked_in', 'im_account')
require File.join(directory, 'linked_in', 'phone_number')
require File.join(directory, 'linked_in', 'twitter_account')

require File.join(directory, 'linked_in', 'api_standard_profile_request')
require File.join(directory, 'linked_in', 'activity')
require File.join(directory, 'linked_in', 'url_resource')
require File.join(directory, 'linked_in', 'company')
require File.join(directory, 'linked_in', 'country')
require File.join(directory, 'linked_in', 'education')
require File.join(directory, 'linked_in', 'error')
require File.join(directory, 'linked_in', 'location')
require File.join(directory, 'linked_in', 'position')
require File.join(directory, 'linked_in', 'group')
require File.join(directory, 'linked_in', 'recommendation')
require File.join(directory, 'linked_in', 'comment')
require File.join(directory, 'linked_in', 'profile')
require File.join(directory, 'linked_in', 'update')
require File.join(directory, 'linked_in', 'network')
require File.join(directory, 'linked_in', 'people')
require File.join(directory, 'linked_in', 'connections')
require File.join(directory, 'linked_in', 'client')
