### Power Shell executable ###

# Run the docker container
docker run --net=host --env="DISPLAY" --volume="$HOME/.Xauthority:/root/.Xauthority:rw" --device /dev/snd -v persistent:/home/gnuradio/persistent --device /dev/dri -v /dev/bus/usb/:/dev/bus/usb/ --privileged --group-add=audio -it ubuntu:gnuradio-releases bash