# @param {String} path
# @return {String}
def simplify_path(path)
  dirs = path.split('/')
  simplified_path_stack = []

  until dirs.empty?
    dir = dirs.shift
    next if ['', '.'].include? dir

    if dir == '..'
      simplified_path_stack.pop
    else
      simplified_path_stack.push(dir)
    end
  end

  '/' + simplified_path_stack.join('/')
end
