cloudwatch_log_stream 'kern.log' do
    file '/var/log/kern.log'
    log_group_name '/var/log/kern.log'
    datetime_format '%b %d %H:%M:%S'
end

cloudwatch_log_stream 'syslog' do
    datetime_format '%b %d %H:%M:%S'
    file '/var/log/syslog'
    log_group_name '/var/log/syslog'
end
