

FROM crossbuild as x86_64-apple-darwin


ENV CROSS_TRIPLE=x86_64-apple-darwin
ENV LD_LIBRARY_PATH /usr/osxcross/lib:$LD_LIBRARY_PATH
ENV PATH=/usr/osxcross/bin/:/usr/bin

RUN git clone --recursive -b v3.11.2 --depth 1 https://github.com/nlohmann/json.git /json && \
    cd /json &&\
    mkdir build &&\
    cd build &&\
    cmake -S ../ -DJSON_BuildTests=OFF  &&\
    crossbuild make -j4 &&\
    ls -l
    


#WORKDIR /app/src
#RUN crossbuild ./compile-all.sh





