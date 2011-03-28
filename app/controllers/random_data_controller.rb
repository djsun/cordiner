class RandomDataController < ApplicationController

  RNG = Random.new
  BASELINE = 500

  def show
    r = RNG.rand(1.0)
    # @data = r > 0.5 ? random_walk : random_data
    @data = random_walk
    respond_to do |format|
      format.html
      format.json { render :json => @data }
    end
  end

  protected

  def random_walk(n = 100)
    slope = 1 + rand(5.0)
    noise_amplitude = 10 + rand(40)
    t0 = BASELINE + rand(noise_amplitude)
    data = []
    n.times do |i|
      t1 = t0 + slope + (noise_amplitude * normal_random)
      data << t1
      t0 = t1
    end
    data
  end

  def random_data(n = 100)
    slope = 1 + rand(5.0)
    noise_amplitude = 10 + rand(40)
    n.times.map do |i|
      BASELINE + (slope * i) + rand(noise_amplitude)
    end
  end

  # An easy to program approximate approach, that relies on the central limit
  # theorem, is as follows: generate 12 uniform U(0,1) deviates, add them all
  # up, and subtract 6 — the resulting random variable will have
  # approximately standard normal distribution. In truth, the distribution
  # will be Irwin–Hall, which is a 12-section eleventh-order polynomial
  # approximation to the normal distribution. This random deviate will have a
  # limited range of (−6, 6).[34]
  #
  # http://en.wikipedia.org/wiki/Normal_distribution
  def normal_random
    -6 + 12.times.map { RNG.rand(1.0) }.reduce(0) { |a, x| a += x }
  end

end
