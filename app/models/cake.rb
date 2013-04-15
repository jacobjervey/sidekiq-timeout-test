class Cake

  include Mongoid::Document

  field :_random, type: Float
  index({:_random => 1})
  before_create :generate_random_key

  field :last_eaten, type: Time

  def self.bake!
    cake = new
    cake.save!
    cake
  end

  def self.random(count=1)
    random_key = rand
    if where(:_random => { '$gte' => random_key }).count >= count
      where(:_random => { '$gte' => random_key })
    elsif where(:_random => { '$lte' => random_key }).count >= count
      where(:_random => { '$lte' => random_key })
    else
      where(:_random.ne => nil)
    end.order_by([ [ [ :_id, :_random ].sample, [ :asc, :desc ].sample ] ]).limit(count)
  end

  def eat!
    time = rand(10)
    puts "Eating cake for #{time} seconds"
    sleep time
    self.last_eaten = Time.now
    save!
    puts "Cake eaten after #{time} seconds"
  end

  def generate_random_key
    self._random = rand
  end

end