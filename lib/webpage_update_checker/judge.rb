require 'mechanize'

module WebpageUpdateChecker
  class Page
    def initialize(checked_uri)
      @checked_uri = checked_uri
    end

    def updated?(previous_diff_value:)
      current_diff_object != previous_diff_value
    end

    def current_diff_value(checked_object)
      checked_object.current_diff_value
    end
  end
end
# WebpageUpdateChecker::DiffValue
# WebpageUpdateChecker::Judge

class CheckByMd5
  def current_diff_value
    require 'digest/md5'

    agent = Mechanize.new
    page = agent.get(@checked_uri)

    Digest::MD5.hexdigest(page.body)
  end
end

require 'mechanize'

module PageByMechanize
  def page_by_mechanize(uri:)
    agent = Mechanize.new
    agent.get(uri)
  end
end

class JudgeApp
  include PageByMechanize

  def updated?(current_diff_object:, previous_diff_value:)
    current_diff_object != previous_diff_value
  end

  def current_diff_value(checked_object)
    checked_object.current_diff_value
  end
end

class CheckByLastModified
  include PageByMechanize

  def initialize(uri:)
    @uri = uri
  end

  def current_diff_value
    agent = Mechanize.new
    page = agent.get(@uri)
    page.header['last-modified']
  end
end

class CheckBySha2
  include PageByMechanize

  def initialize(uri:)
    @uri = uri
  end

  def current_diff_value
    require 'digest/sha2'

    page = page_by_mechanize(uri: @uri)
    Digest::SHA256.hexdigest(page.body)
  end
end

class CheckBySha1
  include PageByMechanize

  def initialize(uri:)
    @uri = uri
  end

  def current_diff_value
    require 'digest/sha1'

    page = page_by_mechanize(uri: @uri)
    Digest::SHA1.hexdigest(page.body)
  end
end

class CheckByMd5
  include PageByMechanize

  def initialize(uri:)
    @uri = uri
  end

  def current_diff_value
    require 'digest/md5'

    page = page_by_mechanize(uri: @uri)
    Digest::MD5.hexdigest(page.body)
  end
end

obj_1 = CheckByLastModified.new(uri: 'http://www.kantei.go.jp/')
obj_2 = CheckBySha2.new(uri: 'http://www.kantei.go.jp/')
obj_3 = CheckBySha1.new(uri: 'http://www.kantei.go.jp/')
obj_4 = CheckByMd5.new(uri: 'http://www.kantei.go.jp/')

obj_all = JudgeApp.new
p obj_all.current_diff_value(obj_1)
p obj_all.current_diff_value(obj_2)
p obj_all.current_diff_value(obj_3)
p obj_all.current_diff_value(obj_4)