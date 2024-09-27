FROM nervos/ckb-riscv-gnu-toolchain:gnu-focal-20230214                                                                                                           

# Install Rust
RUN curl https://sh.rustup.rs -sSf | sh -s -- --default-toolchain nightly-2023-12-07 -y
ENV PATH=/root/.cargo/bin:$PATH
# Install RISC-V target
RUN rustup target add riscv64imac-unknown-none-elf

