# frozen_string_literal: true

module Day3
  class ValueMap
    def self.build
      ([*"a".."z"] + [*"A".."Z"]).each_with_index.map do |item, index|
        [item, index + 1]
      end.to_h
    end
  end
end
