FROM nervos/ckb-riscv-gnu-toolchain:focal-20230214 as nervos-source

FROM nervos/ckb-riscv-gnu-toolchain:gnu-focal-20230214

# Install Rust
RUN curl https://sh.rustup.rs -sSf | sh -s -- --default-toolchain nightly-2023-12-07 -y
ENV PATH=/root/.cargo/bin:$PATH

RUN echo "@@@@@@@@@@@@@@@@@@@@@@ BEFORE copy @@@@@@@@@@@@@@@@@@@ "
RUN echo $(ls -lh /riscv)

COPY --from=nervos-source /riscv /riscv
RUN echo "@@@@@@@@@@@@@@@@@@@@@@ END copy @@@@@@@@@@@@@@@@@@@ "
RUN echo $(ls -lh /riscv)

ENV RISCV /riscv
ENV PATH "${PATH}:${RISCV}/bin"

# Install RISC-V target
RUN rustup target add riscv64imac-unknown-none-elf
