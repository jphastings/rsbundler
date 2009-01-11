class RSBundle
  attr_accessor :name,:files,:source
  
  def initialize(bundle_or_name = nil)
    @files = []
    
    if bundle_or_name =~ /\n/
      @name = bundle_or_name.match(/^(.*)$/)[0]

      realfile = nil
      bundle_or_name.scan(/^(=|\*|\/)(.*)$/).each do |line|
        case line[0]
          when "="
            unless realfile.nil?
              self.add(realfile)
            end
            realfile = RSFiles.new(line[1])
          when "/"
            realfile.add("/#{line[1]}")
          when "*"
            realfile.password = line[1]
        end
      end
      self.add(realfile)
    else
      @name = bundle_or_name
    end
  end
  
  def add(rsfiles)
    if not rsfiles.is_a?(RSFiles)
      raise "RSBundle.add accepts an 'RSFiles' object"
    end
    
    @files.push(rsfiles)
  end
  
  def to_s
    @name
  end
  
  def count
    @files.length
  end
end

class RSFiles
  attr_accessor :name,:password
  attr_reader :links
  
  def initialize(name)
    @name = name
    @links = []
    @password = nil
  end
  
  def add(rapidurl)
    if not rapidurl =~ /^(?:http:\/\/.*\.?rapishare\.com\/files)?(\/[0-9]+\/.+)$/
      raise "That is not a valid rapidshare URL #{rapidurl}"
    end
    @links.push($1)
  end
  
  def links
    @links.collect {|unique| "http://rapidshare.com/files#{unique}"}
  end
  
  def to_s
    @name
  end
end