module Android
  class View
    attr_reader :hash, :children
    def initialize(attrs={},&block)      
      @hash = {}
      @children = []
      attrs.each do |method, value|
        self.send("#{method}=", value)
      end
      yield self if block_given?
    end
  
    def self.properties(*props)
      props.each do |name|        
        define_method "#{name}=" do |val|
          @hash["android:#{name}"] = val
        end
      end
    end
  
    def << (child)
      add(child)
    end
    
    def add(child)      
      @children << child
    end
    
    def as_tag(xml)
      xml.tag!(self.class.to_s, hash) do
        @children.each do |view|
          view.as_tag(xml)
        end
      end
    end
  
    def to_xml
      str = ""
      xml = Builder::XmlMarkup.new(:indent => 5, :target => str)
      xml.instruct!
      #hack that hopes the order is maintained.  Do. Not. Like.
      @hash = { 'xmlns:android' => 'http://schemas.android.com/apk/res/android' }.merge(@hash)
      as_tag(xml)
      str
    end
  end
end

def view_register(view)
  puts view.to_xml
end
