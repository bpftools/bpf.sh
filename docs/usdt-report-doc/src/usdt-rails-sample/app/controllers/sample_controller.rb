class SampleController < ApplicationController
  def all
    1000.times do
      ([] << 1) * 100_000
    end
  end

  def welcome
    100.times do
      ([] << 1) * 100_000
    end
  end

  def slow
    sleep(rand(0.5..1.5))
  end

  def random
    sleep(rand(0..0.9))
  end


  include StaticTracing::Tracer::Concerns::Latency
end
