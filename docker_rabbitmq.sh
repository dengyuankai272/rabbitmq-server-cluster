#!/bin/sh
IMAGE=ilegendsoft/rabbitmq-server-cluster

docker pull $IMAGE

# if first server:
docker run -d -p 5672:5672 -p 15672:15672 -e RABBITMQ_NODENAME=rabbit -e RABBITMQ_SERVER_START_ARGS="-rabbit cluster_nodes {['rabbit@host1','rabbit@host2'],disc}" --name rabbitmq-server-cluster --net="host" $IMAGE

# elif cluster server on other host:
#docker run -d -p 5672:5672 -p 15672:15672 -e RABBITMQ_NODENAME=rabbit -e CLUSTERED=true -e CLUSTER_WITH=zclouddev1 -e CLUSTER_NODENAME=rabbit --name rabbitmq-server-cluster --net="host" $IMAGE

# else cluster server on same host:
#docker run -d -p 5673:5673 -p 15673:15673 -e RABBITMQ_NODENAME=rabbit2 -e CLUSTERED=true -e CLUSTER_WITH=boot2docker -e CLUSTER_NODENAME=rabbit -e RABBITMQ_DIST_PORT=25673 -e RABBITMQ_NODE_PORT=5673 -e RABBITMQ_SERVER_START_ARGS="-rabbitmq_management listener [{port,15673}]" --name rabbitmq-server-cluster2 --net="host" $IMAGE