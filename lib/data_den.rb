# encoding : UTF-8

module DataDen
  extend self

  class NoProviderException < Exception; end

  attr_accessor :store
  def provider
    raise NoProviderException unless store
    store
  end

end
