# rabbitmq-server-cluster
rabbitmq server cluster docker image

## introduction
>This is a project about how to build a rabbitmq cluster docker image.

## how to use it
*   ensure you have installed docker
*   `docker build -t ilegendsoft/rabbitmq-server-cluster dockerfiles/`
*   execute `docker_rabbitmq.sh`
*   `docker ps` or login [http://host1:15672/](http://host1:15672/) with admin/admin to check status.

## configuration
*   `dockerfiles/Dockerfile`:Dockerfile
*   `dockerfiles/erlang.cookie`:Rabbitmq cluster nodes' cookie need to be same.
*   `dockerfiles/rabbitmq.config`:some rabbitmq's configuration, such as user, memory, disk, and so on.
*   `dockerfiles/startrabbit.sh`:CMD in Dockerfile

*   `docker_rabbitmq.sh`:start the container  
    `docker run -d -p 5672:5672 -p 15672:15672 -e RABBITMQ_NODENAME=rabbit -e RABBITMQ_SERVER_START_ARGS="-rabbit cluster_nodes {['rabbit@**host1**','rabbit@**host2**'],disc}" --name rabbitmq-server-cluster --net="host" $IMAGE`


**host1,host2 are your cluster node hostname, you can add more than two.**
