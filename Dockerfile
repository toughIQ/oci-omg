FROM python:3

RUN apt-get update && apt-get upgrade -y

RUN useradd -ms /bin/bash omg
WORKDIR /home/omg

ADD entrypoint.sh .
RUN chmod +x entrypoint.sh

USER omg

#RUN pip3 install o-must-gather --user
RUN git clone https://github.com/kxr/o-must-gather.git && cd o-must-gather && pip install . --user

ENV PATH="/home/omg/.local/bin:$PATH"
RUN ln -s /home/omg/.local/bin/omg /home/omg/.local/bin/oc

WORKDIR /home/omg

VOLUME [ "/home/omg/must-gather" ]

ENTRYPOINT [ "/home/omg/entrypoint.sh" ]

CMD /bin/bash
