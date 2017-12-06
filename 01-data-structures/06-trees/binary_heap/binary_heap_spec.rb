include RSpec

require_relative 'binary_heap'

RSpec.describe BinaryHeap, type: Class do
  let (:root) { Node.new("The Matrix", 87) }

  let (:heap) { BinaryHeap.new(root) }
  let (:pacific_rim) { Node.new("Pacific Rim", 72) }
  let (:braveheart) { Node.new("Braveheart", 78) }
  let (:jedi) { Node.new("Star Wars: Return of the Jedi", 80) }
  let (:donnie) { Node.new("Donnie Darko", 85) }
  let (:inception) { Node.new("Inception", 86) }
  let (:district) { Node.new("District 9", 90) }
  let (:shawshank) { Node.new("The Shawshank Redemption", 91) }
  let (:martian) { Node.new("The Martian", 92) }
  let (:hope) { Node.new("Star Wars: A New Hope", 93) }
  let (:empire) { Node.new("Star Wars: The Empire Strikes Back", 94) }
  let (:mad_max_2) { Node.new("Mad Max 2: The Road Warrior", 98) }

  describe "#insert(data)" do
    it "properly inserts a new node and it doesn't swap with the root" do
      heap.insert(root, district)
      expect(root.right.title).to eq "District 9"
      expect(root.title).to eq "The Matrix"
    end

    it "properly inserts a new node and it swaps with the root" do
      heap.insert(root, braveheart)
      expect(braveheart.right.title).to eq root.title
    end

    it "properly inserts a new node as a right child" do
      heap.insert(root, shawshank)
      heap.insert(root, martian)
      expect(root.right.title).to eq "The Shawshank Redemption"
    end

    it "properly inserts a new node as a left child" do
      heap.insert(root, shawshank)
      heap.insert(root, martian)
      expect(root.left.title).to eq "The Martian"
    end

    it "properly inserts a new node as a right-right child" do
      heap.insert(root, shawshank)
      heap.insert(root, martian)
      heap.insert(root, mad_max_2)
      expect(root.right.right.title).to eq "Mad Max 2: The Road Warrior"
    end

    it "properly inserts a new node as a right-left child" do
      heap.insert(root, shawshank)
      heap.insert(root, martian)
      heap.insert(root, mad_max_2)
      heap.insert(root, empire)
      expect(root.right.left.title).to eq "Star Wars: The Empire Strikes Back"
    end

    it "properly inserts a new node as a left-right child" do
      heap.insert(root, shawshank)
      heap.insert(root, martian)
      heap.insert(root, mad_max_2)
      heap.insert(root, empire)
      heap.insert(root, hope)
      expect(root.left.right.title).to eq "Star Wars: A New Hope"
    end

    it "properly inserts a new node as a left-left child" do
      heap.insert(root, district)
      heap.insert(root, shawshank)
      heap.insert(root, martian)
      heap.insert(root, mad_max_2)
      heap.insert(root, empire)
      heap.insert(root, hope)
      expect(root.left.left.title).to eq "Star Wars: A New Hope"
    end
  end

  describe "#find(data)" do
    it "handles nil gracefully" do
      heap.insert(root, empire)
      heap.insert(root, mad_max_2)
      expect(heap.find(root, nil)).to eq nil
    end
  end

  describe "#delete(data)" do
    it "handles nil gracefully" do
      expect(heap.delete(root, nil)).to eq nil
    end

    it "properly deletes a left node" do
      heap.insert(root, hope)
      heap.delete(root, hope.title)
      expect(heap.find(root, hope.title)).to be_nil
    end
  end

  describe "#print" do
    it "should print" do
      heap.insert(root, mad_max_2)
      heap.insert(root, district)
      heap.insert(root, shawshank)
      heap.insert(root, braveheart)
      heap.insert(root, inception)
      heap.insert(root, pacific_rim)
      heap.insert(root, martian)
      heap.insert(root, jedi)
      heap.insert(root, empire)
      heap.insert(root, hope)
   end
  end
end
