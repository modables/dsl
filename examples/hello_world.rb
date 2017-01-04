gen do

  resource :aws_elb, :elb_health do

    private_zone false
    name 'test'
    zone_id 'gonebaby'

    donts do
      egg [
        'toast',
        'jam',
      ]
      test :json, 'old'
    end

    policy :json do

      statement :list do
        sid 'this'
        condition do
          test 'new'
          variable 's3:prefix'
          values [
            "",
            "home/",
            "home/&{aws:username}/"
          ]
        end
      end

      statement :list do
        sid 'that'
      end

    end

  end

  resource :aws_asg, :unbound do
    name 'test'
    zone_id 'gonebaby'
    private_zone true
  end

end
