
# This is the docker image available. I am using cpu version here. If needed there is gpu version available.
FROM bvlc/caffe:gpu

# Copy the file into docker
COPY requirements.txt requirements.txt

# Run the copied file
RUN pip install -r requirements.txt

# create a folder called model1 and copy all the files in the folder into that folder
ADD . /model1

# Make model1 your work directory
WORKDIR /model1

# Create volumes (folders). one (data) to store data and the other(notebooks) to save your code.
VOLUME ["/model1/data", "/model1/notebooks"]

# Expose your port 8888
EXPOSE 8888

# Run the following command to give a token(password) to your jupyter notebook.
CMD jupyter notebook --no-browser --ip=184.105.157.188 --allow-root --NotebookApp.token='demo'

#/users/aaron/scripts/dockerimage 
# docker build -t aarongpu .
# docker kill $(docker ps -aq)
# docker rm $(docker ps -aq)
# docker run -p 8887:8888 -v ~/home/paperspace/caffemodels/notebooks:/model1/notebooks -v ~/home/paperspace/caffemodels/data:/model1/data -d aarongpu
# 184.105.157.188:8887/?token=demo