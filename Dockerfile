FROM python:3.6.10-stretch

RUN curl https://sh.rustup.rs -sSf | sh -s -- --default-toolchain nightly -y
ENV PATH=/root/.cargo/bin:$PATH

# RUN apt-get update && apt-get install -y --no-install-recommends python3.6-dev python3.6-pip python-dev && rm -rf /var/lib/apt/lists/*

RUN pip3 install setuptools
RUN pip3 install setuptools wheel setuptools-rust

RUN mkdir -p /opt/path-planning

WORKDIR /opt/path-planning

CMD ["python3", "setup.py", "bdist_wheel"]
