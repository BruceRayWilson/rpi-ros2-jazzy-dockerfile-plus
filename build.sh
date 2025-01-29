# You can pass --no-cache as an argument to rebuild the image without using Docker's cache
docker build "$@" -t my_image_plus .
