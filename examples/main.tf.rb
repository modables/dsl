gen do

  resource :google_compute_instance, :www_test do
    name         'www-test'
    machine_type 'f1-micro'
    zone         'us-east1'
    tags         ['www-node']

    disk do
      image 'ubuntu-os-cloud/ubuntu-1404-trusty-v20160602'  
    end

    disk do
      image_2 'ubuntu-os-cloud/ubuntu-frosty'
    end
    network_interface do
      network 'default'
    end

    metadata do
      property 'ssh-keys', "root:#{IO.read(File.expand_path('~/.ssh/gcloud_rsa'))}"
    end
  end

  resource :google_compute_firewall, :default do
    name    'www-test'
    network 'default'

    allow do
      protocol 'tcp'
      ports    ['80']
    end

    source_ranges ['0.0.0.0/0']
    target_tags   ['www-test']
  end

end
