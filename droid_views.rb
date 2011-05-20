require 'rubygems'
require 'nokogiri'

class DroidView

  CLASS_TYPES = {
    'linear_layout'   => 'LinearLayout',
    'text_view'       => 'TextView',
    'relative_layout' => 'RelativeLayout',
    'image_view'      => 'ImageView',
    'button'          => 'Button'
  }

  ATTRIBUTES = {
    'orientation'                         => 'orientation',
    'layout_width'                        => 'layout_width',
    'layout_height'                       => 'layout_height',
    'text'                                => 'text',
    'padding'                             => 'padding',
    'id'                                  => 'id',
    'layout_align_parent_top'             => 'layout_alignParentTop',
    'layout_align_parent_bottom'          => 'layout_alignParentBottom',
    'layout_align_parent_left'            => 'layout_alignParentLeft',
    'layout_align_parent_right'           => 'layout_alignParentLeft',
    'layout_margin_right'                 => 'layout_marginRight',
    'layout_to_right_of'                  => 'layout_toRightOf',
    'layout_align_with_parent_if_missing' => 'layout_alignWithParentIfMissing',
    'layout_above'                        => 'layout_above',
    'single_line'                         => 'singleLine',
    'ellipsize'                           => 'ellipsize',
    'text_color'                          => 'textColor',
    'gravity'                             => 'gravity',
  }

  CLASS_TYPES.each { |shortcut, actual|
    class_eval "def self.#{shortcut}(&block); create \"#{actual}\", block; end"
  }

  ATTRIBUTES.each { |key, value|
    define_method("#{key}=") { |arg| attribute(value, arg.to_s) }
  }

  def self.create(name, block)
    @@current_parent ||= nil
    dv = DroidView.new(name, @@current_parent)
    @@root ||= dv
    previous_parent, @@current_parent = @@current_parent, dv
    block.call dv
    @@current_parent = previous_parent
  end

  def self.render
    doc = Nokogiri::XML::Document.new
    doc.encoding = "UTF-8"
    result = @@root.describe(doc)
    @@root = nil
    puts result
    result.to_s
  end

  def initialize(_name, _parent=nil)
    @name = _name
    @children = []
    @attributes = {}
    unless _parent.nil?
      @parent = _parent
      @parent.child(self)
    end
  end

  def to_s
    "<#{@name}>"
  end

  def child(child)
    @children << child
  end

  def attribute(name, value)
    @attributes["android:#{name}"] = value
  end

  def describe(doc, parent=nil)
    node = doc.create_element(@name, @attributes)
    node.add_namespace("android", "http://schemas.android.com/apk/res/android")
    @children.each { |c| c.describe(doc, node) }
    if @parent.nil?
      doc.root = node
    else
      parent.add_child(node)
    end
    doc
  end
end
