FROM registry.access.redhat.com/ubi8:latest

RUN dnf update -y && dnf install python3 git-core -y

RUN useradd -ms /bin/bash omg
WORKDIR /home/omg

ADD entrypoint.sh .
RUN chmod +x entrypoint.sh

USER omg

# we use the PIP installer to fetch v1 of o-must-gather
RUN pip3 install o-must-gather --user

# v2 of o-must-gather is still WiP
#RUN git clone https://github.com/kxr/o-must-gather.git && cd o-must-gather && pip install . --user

ENV PATH="/home/omg/.local/bin:$PATH"
RUN ln -s /home/omg/.local/bin/omg /home/omg/.local/bin/oc

WORKDIR /home/omg

VOLUME [ "/home/omg/must-gather" ]

ENTRYPOINT [ "/home/omg/entrypoint.sh" ]

CMD /bin/bash
