# Use vanvalenlab/deepcell-tf as the base image
# Change the build arg to edit the tensorflow version.
# Only supporting python3.
ARG DOCKER_TAG=0.12.0-gpu

FROM vanvalenlab/deepcell-tf:${DOCKER_TAG}

# System maintenance
RUN apt-get update && apt-get install -y git && apt-get install -y graphviz && rm -rf /var/lib/apt/lists/* && /usr/bin/python3 -m pip install --no-cache-dir --upgrade pip

WORKDIR /notebooks

# Copy the required setup files and install the deepcell-tf dependencies
COPY setup.py README.md requirements.txt /opt/cell-life-cycle-vae/

# Prevent reinstallation of tensorflow and install all other requirements.
RUN pip install --no-cache-dir -r /opt/cell-life-cycle-vae/requirements.txt

# Copy over deepcell notebooks
COPY notebooks/ /notebooks/

CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--allow-root", "--NotebookApp.iopub_msg_rate_limit=1e10", "--NotebookApp.iopub_data_rate_limit=1e10"]