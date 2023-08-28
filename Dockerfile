FROM rust:1.72
COPY server.crt /
COPY server.key /
WORKDIR "/"
RUN apt-get update -y && \
  apt-get install -y git && \
  git clone https://github.com/neondatabase/neon neon && \
  cd neon && \
  cargo build --release --bin proxy && \
  mv target/release/proxy /usr/local/bin && \
  rm -rf /neon && \
  apt-get purge -y git && \
  apt-get autoremove -y
CMD [\
  "/usr/local/bin/proxy", \
  "-c", "/server.crt",\
  "-k", "/server.key",\
  "--auth-backend=postgres",\
  "--auth-endpoint=postgres://postgres:grafbase@postgres:5432/postgres",\
  "--wss=0.0.0.0:4444"\
]