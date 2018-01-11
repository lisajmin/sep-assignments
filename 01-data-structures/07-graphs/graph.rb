require_relative 'node'

class Graph

  def initialize(node)
    @film_list = Array.new
    @target_actor = node
  end

  def find_kevin_bacon(start_actor)
    @target_actor.film_actor_hash.each do |title, actor|
      actor.each do |actor|
        if actor.name === start_actor.name
          @film_list << title
          puts "#{@film_list}"
          return
        end
      end
    end

    if @film_list.length >= 6 || start_actor.film_actor_hash.empty?
      @film_list=[]
      return nil
    end

    start_actor.film_actor_hash.each do |title, actor|
      actor.each do |actor|
        if actor.name === @target_actor.name
          @film_list << title
          puts "#{@film_list}"
          return
        else
          @film_list << title
          find_kevin_bacon(actor)
        end
      end
    end
  end

end
