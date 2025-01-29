#!/bin/bash
cat <<EOF
# exec.sh: Run a root shell in the running container from a SECOND terminal
# This connects to the same container that run.sh started, with root privileges
# Usage: ./exec.sh 
EOF

CONTAINER=$(docker ps --filter "ancestor=my_image_plus" --format "{{.ID}}")

if [ -z "$CONTAINER" ]; then
    echo "No running container found using image my_image_plus"
    exit 1
fi

docker exec -it -u root $CONTAINER /bin/bash
