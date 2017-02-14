USAGE 
    docker run -ti sternmotor/dnsmasq:latest --help
    docker run -d sternmotor/dnsmasq:latest 

DESCRIPTION
    Small docker demo image showing CMD and ENTRYPOINT script setup

PARAMETER CMD
    CMD may be any option as listed below. All other expressions are run 
    as shell command in started container.

    run     : run dnsmasq, serving as configured
    reload  : re-read dnsmasq config file and content (dnsmasq -s reload)
    test    : test configuration for errors
    version : show dnsmasq version and compile options
    help    : show this help
    login   : login to root shell in container

    All options may be passed as CMD in Dockerfile or at container startup:
        docker run -ti sternmotor/dnsmasq:8.2 version

    All options may be passed to a running container like 
        docker exec -ti dnsmasq_test login


ToDo
"stop" option
