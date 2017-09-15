class Trie
    class Node
        attr_accessor :end
        attr_reader :val, :siblings

        def initialize(val)
            @val = val
            @siblings = []
            @end = false
        end
    end
=begin
    Initialize your data structure here.
=end
    def initialize()
       @root = Node.new(nil)
    end


=begin
    Inserts a word into the trie.
    :type word: String
    :rtype: Void
=end
    def insert(word)
        nodes_c = word.chars.map { |c| Node.new(c) }

        current = @root
        nodes_c.each do |node|
            existing_node = current.siblings.find { |s| s.val == node.val }

            if existing_node
                current = existing_node
            else
                current.siblings << node
                current = node
            end
        end

        current.end = true
    end

=begin
    Returns if the word is in the trie.
    :type word: String
    :rtype: Boolean
=end
    def search(word)
        current = @root
        word.chars.each do |c|
            current = current.siblings.find { |node| node.val == c }
            return false unless current
        end

        current.end
    end


=begin
    Returns if there is any word in the trie that starts with the given prefix.
    :type prefix: String
    :rtype: Boolean
=end
    def starts_with(prefix)
        current = @root
        prefix.chars.each do |c|
            current = current.siblings.find { |node| node.val == c }
            return false unless current
        end

        true
    end
end

# Your Trie object will be instantiated and called as such:
# obj = Trie.new()
# obj.insert(word)
# param_2 = obj.search(word)
# param_3 = obj.starts_with(prefix)