FROM mcr.microsoft.com/playwright:v1.31.0-focal

RUN apt -y update && \
	apt -y install python3-pip vim && \
	pip install pytest-playwright requests urllib3 certifi

COPY playwright /tests

RUN cd /tests && \
    npm update
#    && \
#    npx playwright install-deps

WORKDIR /tests

CMD pytest tests


#docker build --no-cache -t test .

#docker run --rm -e DISPLAY=:0 -v /tmp/.X11-unix:/tmp/.X11-unix -v /mnt/wslg:/mnt/wslg mcr.microsoft.com/playwright:v1.31.2-focal npx -y playwright open google.com

#docker run --rm -e DISPLAY=:0 -v /tmp/.X11-unix:/tmp/.X11-unix -v /mnt/wslg:/mnt/wslg test playwright open google.com

#docker run --rm -e DISPLAY=:0 -v /tmp/.X11-unix:/tmp/.X11-unix -v /mnt/wslg:/mnt/wslg test pytest --headed test_demo.py


#Export Display=:$(ls /tmp/.X11-unix | cut -d "X" -f2) add to .bashrc

#https://github.com/microsoft/wslg/blob/main/samples/container/Containers.md
#https://www.oddbird.net/2022/11/30/headed-playwright-in-docker/

#%USERPROFILE%\.wslconfig
#[wsl2]
#guiApplications = true