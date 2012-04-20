module Jekyll
  class AudioTag < Liquid::Tag

    def initialize(tag_name, title, tokens)
      super
      @title = title.strip
    end

    def render(context)
        "<audio controls preload><source src=\"/audio/stories/#{@title}.ogg\"></source><source src=\"/audio/stories/#{@title}.mp3\"></source></audio>"

    end
  end

  class StoryTag < Liquid::Tag

    def initialize(tag_name, text, tokens)
      super
      params = text.split("~")
      @title = params[0]
      @slug = params[1]
      @desc = params[2]
    end

    def render(context)
        "<div class=\"block example\"><p><strong>#{@title}</strong></p><p><img src=\"/audio/stories/#{@slug}.jpg\" style=\"float: left; padding: 5px;\" /> #{@desc}</p><p><a href=\"/audio/stories/#{@slug}.html\" title=\"#{@title}\">Listen and Read</a></p></div>"

    end
  end
end

Liquid::Template.register_tag('audio', Jekyll::AudioTag)
Liquid::Template.register_tag('story', Jekyll::StoryTag)
