require 'resources_builder'
require 'pry'

module Modiz
  class StepsBuilder
    attr_reader :to_array

    def initialize(steps_string)
      @lines = steps_string
    end

    def to_array
      steps.map do |step|
        {     title: title(step),
        description: description(step),
          resources: resources(step) }
      end
    end

    private

    def steps
      @lines.split("\n### ").reject(&:empty?)
    end

    def resources(step)
      if step.match "#### Ressources"
        ress = step.split("#### Ressources").last
        ResourcesBuilder.new(ress).to_hash
      else
        nil
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
