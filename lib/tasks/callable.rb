# frozen_string_literal: true

# Simple mixin creator for allowing class.call
module Callable
  def call(*args)
    self.new.call(*args)
  end
end
