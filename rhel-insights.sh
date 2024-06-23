#!/bin/bash

# Initial Insights set up

echo 'rhel-insights.sh is registering this system with RHEL System Insights' &>> config.log

subscription-manager register &>> config.log

if [ $? -eq 0 ] || [ $? -eq 64 ]; then
    
    echo 'Installing insights-client' &>> config.log
    yum -y install insights-client &>> config.log
        
        if [ $? -eq 0]; then

            echo 'Registering insights client with RHEL System Insights'
            insights-client --register &>> error.log

                if [ $? -eq 0]; then
                else
                    echo 'Unknown error' &>> error.log
                    echo 'Registration aborted' &>> error.log
                fi
else

    echo 'Unknown error' &>> error.log
    echo 'Registration aborted' &>> error.log

fi

echo '---' >> config.log