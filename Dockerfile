FROM archlinux

RUN pacman -Syu --noconfirm && yes | pacman -Scc
RUN pacman -S --noconfirm base-devel wget
RUN pacman -S --noconfirm opus
RUN wget http://www.creytiv.com/pub/re-0.6.1.tar.gz
RUN tar -xvzf re-0.6.1.tar.gz; ln -s re-0.6.1 re; make -C re-0.6.1 libre.a

RUN wget http://www.creytiv.com/pub/rem-0.6.0.tar.gz
RUN tar -xvzf rem-0.6.0.tar.gz; ln -s rem-0.6.0 rem; make -C rem-0.6.0 librem.a

RUN wget http://www.creytiv.com/pub/baresip-0.6.5.tar.gz
RUN tar -xvzf baresip-0.6.5.tar.gz; make -C baresip-0.6.5 USE_OPENSSL="yes" LIBRE_SO=../re LIBREM_PATH=../rem STATIC=1 
RUN pacman -S --noconfirm vim
