cloudwatch_log_stream 'kern.log' do
    file '/var/log/kern.log'
    log_group_name '/var/log/kern.log'
    log_stream_name '{instance_id}'
    datetime_format '%b %d %H:%M:%S'
    buffer_duration '5000'
    initial_position 'start_of_file'
end

cloudwatch_log_stream 'syslog' do
    datetime_format '%b %d %H:%M:%S'
    file '/var/log/syslog'
    buffer_duration '5001'
    log_stream_name '{instance_id}'
    initial_position 'start_of_file'
    log_group_name '/var/log/syslog'
end
