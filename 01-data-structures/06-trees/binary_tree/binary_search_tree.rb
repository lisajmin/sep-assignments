require_relative 'node'

class BinarySearchTree

  def initialize(root)
    @root = root
  end

  def insert(root, node)
    if root.rating > node.rating
      root.left == nil ? root.left = node : insert(root.left, node)
    else
      root.right == nil ? root.right = node : insert(root.right, node)
    end
  end

  # Recursive Depth First Search
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

  def delete(root, data)
    if root.nil? || data.nil?
      return nil
    else
      find_node = find(root, data)
      find_node == nil ? nil : (find_node.title = nil && find.node.rating = nil)
    end
  end

  # Recursive Breadth First Search
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
