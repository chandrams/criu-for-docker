#!/bin/bash

source ./common_env_vars.sh

check_server_started() {
        local retry_counter=0
        while true;
        do
                echo "INFO: Checking if application started (retry counter=${retry_counter})"
                grep "${LOG_MESSAGE}" "${LOG_LOCATION}" &> /dev/null
                local app_started=$?
                if [ ${app_started} -eq 0 ]; then
                        echo "INFO: Application started successfully!"
                        break
                else
                        if [ $retry_counter -eq ${TIMEOUT} ]; then
                                echo "ERROR: Application did not start properly"
                                exit 1
                        fi
                        retry_counter=$(($retry_counter+1))
                        sleep 1s
                fi
        done
}

start_app() {
	# add code to start the application here.
	# write application pid to ${CR_LOG_DIR}/${APP_PID_FILE} file
}

stop_app() {
	# add code to stop the application here
}

