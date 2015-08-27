FROM rabbitmq:3.5.3
MAINTAINER slv slv@ilegendsoft.com

RUN mkdir /opt/rabbit
ADD startrabbit.sh /opt/rabbit/
ADD rabbitmq.config /etc/rabbitmq/
ADD erlang.cookie /var/lib/rabbitmq/.erlang.cookie

RUN chmod a+x /opt/rabbit/startrabbit.sh
RUN chmod u+rw /etc/rabbitmq/rabbitmq.config

RUN rabbitmq-plugins enable --offline rabbitmq_mqtt rabbitmq_stomp rabbitmq_management  rabbitmq_management_agent rabbitmq_management_visualiser rabbitmq_federation rabbitmq_federation_management sockjs

EXPOSE 5672
EXPOSE 15672
EXPOSE 25672
EXPOSE 4369
EXPOSE 9100
EXPOSE 9101
EXPOSE 9102
EXPOSE 9103
EXPOSE 9104
EXPOSE 9105

CMD /opt/rabbit/startrabbit.sh