directory '/opt/aws/cloudwatch' do
    recursive true
end

cookbook_file '/opt/aws/cloudwatch/awslogs-agent-setup.py' do
    source 'awslogs-agent-setup.py'
    mode '0755'
end

cookbook_file '/tmp/cwlogs.cfg' do
    source 'cwlogs.cfg'
    mode '0755'
end

execute 'Install CloudWatch Logs agent' do
    command "/opt/aws/cloudwatch/awslogs-agent-setup.py -n -r #{node['cloudwatch-logs']['region']} -c /tmp/cwlogs.cfg"
    not_if { system 'pgrep -f awslogs-agent-setup' }
end
