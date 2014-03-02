AndySite.helpers do
  NEWLINE = "\n".html_safe.freeze

  # 重写padrino的content_tag方法
  # 目的是解决content_tag中包含block时 html串位bug
  # 问题: 需要思考 为什么使用原有的content_tag方法 会导致html 串位?
  def content_tag(name, content = nil, options = nil, &block)
    if block_given?
      options = content if content.is_a?(Hash)
      content = capture_html(&block)
      return content_tag(name, content, options)
    end

    options    = parse_data_options(name, options)
    attributes = tag_attributes(options)
    output = ActiveSupport::SafeBuffer.new
    output.safe_concat "<#{name}#{attributes}>"

    if content.respond_to?(:each) && !content.is_a?(String)
      content.each { |c| output.concat c; output.safe_concat NEWLINE }
    else
      output.concat content.to_s
    end
    
    output.safe_concat "</#{name}>"
  end

  #content_tag的扩展
  #example:
  #contents_tag :div, :class => :test do |contents|
  #  contents << content_tag :span, span_1
  #  contents << content_tag :span, span_2
  #end
  def contents_tag(tag_name, options = {}, &block)
    content_tag tag_name, options do
      html_contents(&block)
    end
  end

  def html_contents(&block)
    contents = []
    yield contents
    contents = contents.join(' ').html_safe if contents.count > 0
    contents = contents.html_safe if contents.respond_to?(:html_safe)
    contents
  end
end