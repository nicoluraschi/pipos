class PiposController < ApplicationController
	def index
    response = HTTParty.get(ENV['API_ENDPOINT'])
    @pipos = JSON.parse(response.body.gsub('=>', ':'))
  end

  def new; end

  def upload
    s3_obj = S3_BUCKET.bucket(ENV['S3_BUCKET']).object(File.join('pipoUploads', params[:file].original_filename))
    s3_obj.put({
      acl: 'public-read-write',
      body: params[:file]
    })
    redirect_to pipos_path
  end
end