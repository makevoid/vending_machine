# a logger that it's Object#to_s friendly (it doesn't output all the verbose infos)

class QuietLogger
  def logger
    Logger.new $stdout
  end
end