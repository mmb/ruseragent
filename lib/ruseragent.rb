
module Ruseragent

  class Ruseragent

    def initialize()
      # user agent => [user tags, ]
      @agents = {
        'Mozilla/3.01Gold (X11; I; SunOS 5.5.1 sun4m)' => [:old, ],
        'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.0)' => [],
        'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)' => [],
        'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_5_6; en-us) AppleWebKit/528.16 (KHTML, like Gecko) Version/4.0 Safari/528.16' => [],
        'Mozilla/5.0 (X11; U; Linux i686;en-US; rv:1.2.1) Gecko/20030225' => [],
        }

      # add auto tags
      @agents.each_key { |k| @agents[k] = @agents[k].concat(autotags(k)) }

      @tags = {}
      @agents.each_pair do |u,tags|
        tags.each do |t|
          @tags[t] = [] unless @tags.key?(t)
          @tags[t].push(u)
        end
      end
    end

    def autotags(u)
      tags = []
      {
        /Googlebot/ => [:spider, :googlebot],
        /Linux/ => :linux,
        /libwww-perl/ => [:perl, :script],
        /MSIE/ => :ie,
        /MSIE 6\.0/ => :ie6,
        /Python-urllib/ => [:python, :script]
        /Safari/ => :safari,
        /SunOS/ => :sunos,
        /Windows/ => :windows,
        /X11/ => :x11,
      }.each { |r,t| tags.push(*t) if u.match(r) }
      tags
    end

    def random(*tags)
      if tags.empty?
        pool = @agents.keys
      else
        pool = []
        tags.each { |t| pool = pool.concat(@tags[t]).uniq }
      end
      pool[rand(pool.length)]
    end

    def identify(u)
      @agents[u] || autotags(u)
    end

  end

end
