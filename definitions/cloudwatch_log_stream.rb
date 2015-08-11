define :cloudwatch_log_stream do
    service 'awslogs' do
        action :nothing
    end

    template "/var/awslogs/etc/conf.d/#{params[:name]}.conf" do
        source 'log-stream.conf.erb'

        variables(
            :name => params[:name],
            :config => params.tap{|x| x.delete(:name)}
        )

        notifies :restart, 'service[awslogs]', :delayed
    end
end