require 'resources_builder'
require 'pry'

module Modiz
  class StepsBuilder
    attr_reader :to_array

    def initialize(lines)
      @steps_ary = lines.split(title_hashtags(3)).reject(&:empty?)
    end

    def to_array
      @steps_ary.map do |step|
        {     title: title(step),
        description: description(step),
          resources: resources(step) }
      end
    end

    private

    def split_on_resource step
      step.split("#### Ressources")
    end

    def resources step
      if step.match title_hashtags(4)
        ressources = split_on_resource(step).last
        ResourcesBuilder.new(ressources).to_hash
      else
        nil
      end
    end

    def title step
      step.split(double_line).first[/\w(.*)$/]
    end

    def description step
      desc = split_on_resource(step).first.split(double_line)
      desc.shift
      desc.join(double_line)
    end

    def title_hashtags size
      "\n#{"#" * size} "
    end

    def double_line
      "\n\n"
    end
  end
end
