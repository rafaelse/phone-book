module ApplicationHelper

  def display_division_tree (division)
    content_tag("div", construct_tree(division), class: 'tree')
  end

  private

  def construct_tree (division)
    division_stack = []
    until division == nil
      division_stack.push(division)
      division = division.parent_division
    end
    level = 1
    tree = ""
    until division_stack.empty?
      tree += division_stack.pop.name
      unless division_stack.empty?
        tree += "\n"
        tree += "    " * level
        tree += "↳"
      end
      level += 1
    end

    tree
  end
end
