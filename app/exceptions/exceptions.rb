module Exceptions
  class DefaultError < RuntimeError
    attr_accessor :status_code, :error_code, :objects

    def initialize(hash = {})
      msg = hash.key?(:msg) ? hash[:msg] : '서버에서 에러가 발생했습니다'
      @error_code = hash.key?(:error_code) ? hash[:error_code] : 0
      @status_code = hash.key?(:status_code) ? hash[:status_code] : :unexpected_error
      @objects = hash.key?(:objects) ? hash[:objects] : []
      super(msg)
      self.set_backtrace(hash[:cause].backtrace) if hash[:cause].present?
    end
  end

end