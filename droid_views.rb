require 'rubygems'
require 'nokogiri'

class DroidView

  CLASS_TYPES = {
    'linear_layout'   => 'LinearLayout',
    'text_view'       => 'TextView',
    'relative_layout' => 'RelativeLayout',
    'image_view'      => 'ImageView',

  }

  ATTRIBUTES = {
    'orientation'   => 'orientation',
    'layout_width'  => 'layout_width',
    'layout_height' => 'layout_height',
    'text'          => 'text',
    'padding'       => 'padding',
    'id'            => 'id',
    'layout_align_parent_top'    => 'layout_alignParentTop',
    'layout_align_parent_bottom' => 'layout_alignParentBottom',
    'layout_align_parent_left'   => 'layout_alignParentLeft',
    'layout_align_parent_right'  => 'layout_alignParentLeft',
    'layout_margin_right' => 'layout_marginRight',
    'layout_to_right_of'  => 'layout_toRightOf',
    'layout_align_with_parent_if_missing' => 'layout_alignWithParentIfMissing',
    'layout_above' => 'layout_above',
    'single_line'  => 'singleLine',
    'ellipsize'    => 'ellipsize',
    'text_color'   => 'textColor',
    'gravity'      => 'gravity',
  }
  
  CLASS_TYPES.each { |shortcut, actual|
    class_eval "def self.#{shortcut}(&block); create \"#{actual}\", block; end"
  }

  ATTRIBUTES.each { |key, value| 
    define_method("#{key}=") { |arg| attribute(value, arg.to_s) }
  }
  
  def self.create(name, block)
    @@last_class ||= nil
    @@first_class ||= nil
    dv = DroidView.new(name, @@last_class)
    @@first_class = dv unless @@first_class
    @@last_class = dv
    dv.fill_in(block)
  end

  def self.render
    doc = Nokogiri::XML::Document.new
    doc.encoding = "UTF-8"
    puts @@first_class.describe(doc)
    @@first_class, @@last_class = nil
  end

  def initialize(_name, _parent)
    @name = _name
    family(_parent)
    @children = []
    @attributes = {}
  end

  def fill_in(block)
    block.call self
  end

  def family(parent)
    return unless parent
    @parent = parent
    parent.child(self)
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
