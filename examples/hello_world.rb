gen do

  section :resource, :aws_elb, :elb_health do
    arguments do
      private_zone false
      name 'test'
      zone_id 'gonebaby'
      statement :list do
        sid 'this'
      end
      statement :list do
        sid 'that'
      end
    end
  end

  section :resource, :aws_asg, :unbound do
    arguments do
      name 'test'
      zone_id 'gonebaby'
      private_zone true
    end
  end

end
