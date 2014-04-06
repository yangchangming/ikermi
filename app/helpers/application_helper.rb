# Methods added to this helper will be available to all templates in the application.
require 'rexml/parsers/pullparser'

module ApplicationHelper

  #是否使用微软雅黑字体
  def use_yahei_font?(ua)
    use = true
    ["Windows NT 5.2", "Windows NT 5.1"].each do |w|
      if ua.include?(w)
        use = false
        break
      end
    end
    return use
  end

  # 去除区域里面的内容的换行标记-with_output_buffer方法该版本不支持
  def spaceless(&block)
    data = with_output_buffer(&block)
    data = data.gsub(/\n\s+/," ")
    data = data.gsub(/>\s+</,"> <")
    raw data
  end

  #截取含有html标签的字符串，不会破坏html的完整性
  def truncate_html(len, ellipsis,article)
    p = REXML::Parsers::PullParser.new(article)
    tags = []
    new_len = len
    results = ''
    while p.has_next? && new_len > 0
      p_e = p.pull
      case p_e.event_type
      when :start_element
        tags.push p_e[0]
        results << "<#{tags.last} #{attrs_to_s(p_e[1])}>"
      when :end_element
        results << "</#{tags.pop}>"
      when :text
        results << p_e[0].first(new_len)
        new_len -= p_e[0].length
      else
        results << "<!-- #{p_e.inspect} -->"
      end
    end
    tags.reverse.each do |tag|
      results << "</#{tag}>"
    end
    results + ellipsis
  end

  private
  def attrs_to_s(attrs)
    if attrs.empty?
      ''
    else
      attrs.to_a.map { |attr| %{#{attr[0]}="#{attr[1]}"} }.join(' ')
    end
  end

end
