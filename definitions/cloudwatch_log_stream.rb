define :cloudwatch_log_stream do
    params[:log_stream_name] ||= node['cloudwatch-logs']['log_stream_name']

    service 'awslogs' do
        action :nothing
    end

    template "/var/awslogs/etc/config/#{params[:name]}.conf" do
        source 'log-stream.conf.erb'
        cookbook 'cloudwatch-logs'

        variables(
            :name => params[:name],
            :config => params.tap{|x| x.delete(:name)}
        )

        notifies :restart, 'service[awslogs]', :delayed
    end
end
