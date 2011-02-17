CarrierWave.configure do |config|
  config.grid_fs_database = Mongoid.database.name
  config.grid_fs_host = 'localhost'
  config.grid_fs_access_url = "/images"
end
