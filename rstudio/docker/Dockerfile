FROM rocker/tidyverse:3.6.1

RUN R -e "install.packages(c('mlflow', 'caret', 'reticulate'), repos = 'http://cran.rstudio.com/')"

ENV LANG=C.UTF-8 LC_ALL=C.UTF-8
ENV PATH /opt/conda/bin:$PATH

RUN apt-get update --fix-missing && \
    apt-get install -y \
    wget \
    bzip2 \
    ca-certificates \
    libglib2.0-0 \
    libxext6 \
    libsm6 \
    libxrender1 \
    git 

RUN wget --quiet https://repo.anaconda.com/miniconda/Miniconda2-4.7.12-Linux-x86_64.sh -O ~/miniconda.sh && \
            /bin/bash ~/miniconda.sh -b -p /opt/conda && \
                rm ~/miniconda.sh && \
                    ln -s /opt/conda/etc/profile.d/conda.sh /etc/profile.d/conda.sh && \
                        echo ". /opt/conda/etc/profile.d/conda.sh" >> ~/.bashrc && \
                            echo "conda activate base" >> ~/.bashrc

RUN pip install --upgrade pip
RUN pip install mlflow>=1.0 \
    && pip install azure-storage==0.36.0 \
        && pip install numpy==1.14.3 \
            && pip install scipy \
                && pip install pandas==0.22.0 \
                    && pip install scikit-learn==0.19.1 \
                        && pip install cloudpickle

RUN echo "www-frame-origin=same" >> /etc/rstudio/disable_auth_rserver.conf
