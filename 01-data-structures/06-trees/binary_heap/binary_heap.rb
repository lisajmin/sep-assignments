require_relative 'node'

class BinaryHeap

  attr_accessor :temp

  def initialize(root)
    @root = root
  end

  def insert(root, node)
    if root.rating > node.rating
      temp = root.dup
      root.rating = node.rating
      root.title = node.title
      insert(root, temp)
    else
      if root.right == nil
        root.right = node
      elsif (root.left == nil) && (root.right != nil)
        root.left = node
      elsif (root.left != nil) && (root.right != nil) && (root.right.right != nil) && (root.right.left != nil)
        insert(root.left, node)
      elsif (root.left != nil) && (root.right != nil)
        insert(root.right, node)
      end
    end
  end

  def delete(root, data)
    if root.nil? || data.nil?
      return nil
    else
      find_node = find(root, data)
      find_node == nil ? nil : (find_node.title = nil && find.node.rating = nil)
    end
  end

  def find(root, data)
    if root.nil? || data.nil?
      return nil
    else
      if root.title == data
        return root
      elsif root.left != nil
        find(root.left, data)
      elsif root.right != nil
        find(root.right, data)
      end
    end
  end

  def printf(children=nil)
    list = [@root]

    while list.length > 0 do
      item = list.shift
      puts "#{item.title}: #{item.rating}"
      if item.left != nil
        list.push(item.left)
      end
      if item.right != nil
        list.push(item.right)
      end
    end
  end
end
