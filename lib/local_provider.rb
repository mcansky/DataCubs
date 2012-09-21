# encoding: UTF-8

module DataDen
  class LocalProvider
    attr_accessor :path
    def initialize(_path = '/tmp')
      @path = _path
    end
    def put(_key, _data)
      raise ArgumentError unless _key && _data
      File.open("#{path}/#{_key}", "wb") { |f| f.write _data }
    end
    def get (_key)
      raise Errno::ENOENT unless File.exist?("#{path}/#{_key}")
      IO.read("#{path}/#{_key}")
    end
  end
end
