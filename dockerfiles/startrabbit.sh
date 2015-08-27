#!/bin/bash
chown rabbitmq:rabbitmq /var/lib/rabbitmq/.erlang.cookie
chmod 400 /var/lib/rabbitmq/.erlang.cookie

RABBITMQ_NODENAME=$RABBITMQ_NODENAME /usr/sbin/rabbitmq-server

# if [ -z "$CLUSTERED" ]; then
# 	# if not clustered then start it normally as if it is a single server
# 	RABBITMQ_NODENAME=$RABBITMQ_NODENAME /usr/sbin/rabbitmq-server
# else
# 	if [ -z "$CLUSTER_WITH" -o -z "$CLUSTER_NODENAME" ]; then
# 		# If clustered, but cluster with is not specified then again start normally, could be the first server in the
# 		# cluster
# 		RABBITMQ_NODENAME=$RABBITMQ_NODENAME /usr/sbin/rabbitmq-server
# 	else
# 		RABBITMQ_NODENAME=$RABBITMQ_NODENAME /usr/sbin/rabbitmq-server -detached
# 		/usr/sbin/rabbitmqctl stop_app
# 		if [ -z "$RAM_NODE" ]; then
# 			/usr/sbin/rabbitmqctl join_cluster $CLUSTER_NODENAME@$CLUSTER_WITH
# 		else
# 			/usr/sbin/rabbitmqctl join_cluster --ram $CLUSTER_NODENAME@$CLUSTER_WITH
# 		fi
# 		/usr/sbin/rabbitmqctl start_app
# 		# /usr/sbin/rabbitmq-plugins enable rabbitmq_mqtt rabbitmq_stomp rabbitmq_management  rabbitmq_management_agent rabbitmq_management_visualiser rabbitmq_federation rabbitmq_federation_management sockjs
		
# 		# Tail to keep the a foreground process active..
# 		#tail -f /var/log/rabbitmq/rabbit\@$HOSTNAME.log
# 		tail -f /etc/hosts
# 	fi
# fi

