FROM ubuntu:18.04

ENV LANG=C.UTF-8 LC_ALL=C.UTF-8
ENV PATH /opt/conda/bin:$PATH

RUN apt-get update --fix-missing && \
    apt-get install -y --no-install-recommends \
    wget \
    bzip2 \
    ca-certificates \
    curl \
    git \
    texlive \
    texlive-fonts-recommended \
    texlive-plain-generic \
    texlive-xetex \
    unzip \
    vim &&\
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/*

RUN wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-4.7.12-Linux-x86_64.sh -O ~/miniconda.sh && \
    /bin/bash ~/miniconda.sh -b -p /opt/conda && \
    rm ~/miniconda.sh && \
    /opt/conda/bin/conda clean -tipsy && \
    ln -s /opt/conda/etc/profile.d/conda.sh /etc/profile.d/conda.sh && \
    echo ". /opt/conda/etc/profile.d/conda.sh" >> ~/.bashrc && \
    echo "conda activate tf_env" ~/.bashrc

RUN conda update -n base -c defaults conda
RUN conda create --name tf_env python=3.6
RUN conda update -y conda
RUN conda install --name tf_env -c conda-forge \
    jupyter_nbextensions_configurator \
    jupyterhub \
    jupyterlab \
    numpy \
    matplotlib \
    scikit-learn \
    seaborn \
    statsmodels \
    pandas \
    scipy \
    sympy \
    && conda clean -ay

RUN conda install --name tf_env \
    tensorflow-gpu==2.0.0

COPY ./jupyterhub_config.py /etc/jupyterhub/

COPY ./user.sh /
RUN chmod +x /user.sh && /user.sh

EXPOSE 8000

SHELL ["conda", "run", "-n", "tf_env", "/bin/bash", "-c"]
COPY ./startup.sh /
RUN chmod +x /startup.sh
ENTRYPOINT ["conda", "run", "-n", "tf_env", "/bin/bash", "startup.sh"]
