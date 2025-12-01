FROM condaforge/mambaforge:latest

# Setup
WORKDIR /home/sbx_virsorter_env

COPY envs/sbx_virsorter_env.yml ./

# Install environment
RUN conda env create --file sbx_virsorter_env.yml --name sbx_virsorter

ENV PATH="/opt/conda/envs/sbx_virsorter/bin/:${PATH}"

# "Activate" the environment
SHELL ["conda", "run", "-n", "sbx_virsorter", "/bin/bash", "-c"]

# Run
CMD "bash"