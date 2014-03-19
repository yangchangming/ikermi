module FileProcess

  protected
  def file_upload(file)
    if !file.original_filename.empty?
      @filename=getFileName(file.original_filename)
      File.open("#{RAILS_ROOT}/public/upload/images/#{@filename}", "wb") do |f|
        f.write(file.read)
      end
      return @filename
    end
  end

  def getFileName(filename)
    if !filename.nil?
      return filename
    end
  end


end