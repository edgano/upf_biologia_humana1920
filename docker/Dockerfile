FROM debian:jessie
MAINTAINER Edgar Garriga <edgano@gmail.com>

## Docker image for UPF biologia humana 2019


RUN apt-get clean && apt-get -y update && apt-get install git cmake

# Install TCOFFEE
RUN git clone https://github.com/cbcrg/tcoffee.git tcoffee && \
    cd tcoffee && \
    git checkout e8ea3ba54cf1983d1c61ffd2993c0b376e28fba0 && \
    cd compile && \
    make t_coffee && \
    cp t_coffee /bin/.

# Install BLAST
RUN wget ftp://ftp.ncbi.nlm.nih.gov/blast/executables/blast+/LATEST/ncbi-blast-2.9.0+-x64-linux.tar.gz && \
    tar -xvf ncbi-blast-2.9.0+-x64-linux.tar.gz && \
    cp ncbi-blast-2.9.0+/bin/* /bin/ && \
    rm ncbi-blast-2.9.0+-x64-linux.tar.gz

#install EXONERATE
RUN wget http://ftp.ebi.ac.uk/pub/software/vertebrategenomics/exonerate/exonerate-2.2.0-x86_64.tar.gz && \
    tar -xvf exonerate-2.2.0-x86_64.tar.gz && \
    cp exonerate-2.2.0-x86_64/bin* /bin/ && \
    rm exonerate-2.2.0-x86_64.tar.gz

#install GENEWISE
RUN wget https://github.com/hallamlab/metapathways2/raw/master/executables/ubuntu/genewise && \
    chmod +x genewise && \
    cp genewise /bin