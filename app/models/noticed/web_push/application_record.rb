module Noticed
  module WebPush
    class ApplicationRecord < ActiveRecord::Base
      self.abstract_class = true
    end
  end
end
