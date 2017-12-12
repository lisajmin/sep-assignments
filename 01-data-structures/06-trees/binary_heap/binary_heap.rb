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
    elsif root.title == data
      root.title = root.right.title
      root.rating = root.right.rating
      temp_node = root.right.dup
      root.right = nil
      if temp_node.left != nil
        reorder(temp_node.left)
      end
      if temp_node.right != nil
        reorder(temp_node.right)
      end
    else
      node = find(root, data)
      parent = find_parent(root, node)
      if parent.left == node
        parent.left = nil
      elsif parent.right == node
        parent.right = nil
      end
      if node.left != nil
        reorder(node.left)
      end
      if node.right != nil
        reorder(node.right)
      end
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
    queue = [@root]
    list = [@root]

    while queue.length > 0 do
      item = queue.shift
      if item.left != nil
        queue.push(item.left)
        list.push(item.left)
      end
      if item.right != nil
        queue.push(item.right)
        list.push(item.right)
      end
    end

    list.each_with_index do |item, index|
      if index == 0
        level = 0
      else
        level = (Math.log2(index + 1)).floor
      end
      if item != nil
        title = item.title
        rating = item.rating
        puts "Tree Level #{level} - #{title}: #{rating}"
      end
    end
  end

  private

  def find_parent(root, data)
    if root.left == data || root.right == data
      return root
    elsif root.right != nil
      find_parent(root.right, data)
    elsif root.left != nil
      find_parent(root.left, data)
    end
  end

  def reorder(target)
    insert(@root, target)
    if target.left != nil
      insert(@root, target.left)
    end
    if target.right != nil
      insert(@root, target.right)
    end
  end
end
