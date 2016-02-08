require 'resources_builder'
require 'pry'

module Modiz
  class StepsBuilder
    attr_reader :to_array

    def initialize(steps_string)
      @lines = steps_string
    end

    def to_array
      step_builder
    end

    private

    def steps
      @lines.split("\n### ").reject(&:empty?)
    end

    def step_builder
      steps.map do |step|
        {     title: title(step),
        description: description(step),
          resources: ResourcesBuilder.new(step).to_hash }
      end
    end

    def title(step)
      step.split("\n\n").first[/\w(.*)$/]
    end

    def description(step)
      desc = step.split("#### Ressources")
                 .first
                 .split("\n\n")
      desc.shift
      desc.join
    end
  end
end
