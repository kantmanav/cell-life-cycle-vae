# Use vanvalenlab/deepcell-tf as the base image
# Change the build arg to edit the tensorflow version.
# Only supporting python3.
ARG DOCKER_TAG=0.12.0-gpu

FROM vanvalenlab/deepcell-tf:${DOCKER_TAG}

# System maintenance
RUN apt-get update && apt-get install -y git && apt-get install -y graphviz && rm -rf /var/lib/apt/lists/*

WORKDIR /cell-life-cycle-vae

# Copy the required setup files and install the deepcell-tf dependencies
COPY requirements.txt .

# Prevent reinstallation of tensorflow and install all other requirements.
RUN pip install --no-cache-dir -r requirements.txt

CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--allow-root", "--NotebookApp.iopub_msg_rate_limit=1e10", "--NotebookApp.iopub_data_rate_limit=1e10"]
