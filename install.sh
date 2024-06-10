#!/bin/env bash


# OpenCVE
    if [ -d "$opencve-docker" ]; then
        echo "OpenCVE is already installed!"
    else
        echo "Installing OpenCVE..."
        git clone https://github.com/opencve/opencve-docker.git
        cd opencve-docker && cp ./conf/opencve.cfg.example ./conf/opencve.cfg
        sudo docker-compose build
        sudo docker-compose up -d postgres redis webserver celery_worker
        sudo docker exec -it webserver opencve upgrade-db
        sudo docker exec -it webserver opencve import-data
        sudo docker exec -it webserver opencve create-user root root@root.com --admin
        docker-compose up -d celery_beat
        cd ..
        echo "OpenCVE installed!"
    fi

# CVEMap
    if [ "$(dpkg -l | awk '/cvemap/ {print }'|wc -l)" -ge 1 ]; then
        echo "CVEMap is already installed!"
    else
        echo "Installing CVEMap..."
        go install github.com/projectdiscovery/cvemap/cmd/cvemap@latest
        echo "CVEMap installed!"
    fi

# OSV
    if [ "$(dpkg -l | awk '/osv-scanner/ {print }'|wc -l)" -ge 1 ]; then
        echo "OSV is already installed!"
    else
        echo "Installing OSV..."
        go install github.com/google/osv-scanner/cmd/osv-scanner@v1
        echo "OSV installed!"
    fi
