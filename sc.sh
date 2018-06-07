version: '3'


# This allows us to define multiple hostnames for each service for DNS purposes.  Each service that specifies this
# network name (zmsnetwork) can be found via DNS.  By default, each service can be found via 'nslookup <service-name>'.
networks:
  zmsnetwork:
    driver: bridge


services:
    consul:
      image: zimperium-dockerv2-local.jfrog.io/consul:1.0.9
      ports:
        - 8500:8500
      container_name: consul
      env_file: tesenv.env
      networks:
        zmsnetwork:
          aliases:
            - consul.service.consul
      volumes:
        - /data/shared_java_env:/shared_java_env

    datadog:
      env_file: tesenv.env
      image: zimperium-dockerv2-local.jfrog.io/datadog:latest
      container_name: datadog
      depends_on:
        - consul
      networks:
        zmsnetwork:
          aliases:
            - datadog.service.consul

    admin:
      env_file: tesenv.env
      image: zimperium-dockerv2-local.jfrog.io/admin:1.0.10
      container_name: admin
      depends_on:
        - consul
      ports:
        - 8081:8080
      networks:
        zmsnetwork:
          aliases:
            - admin.service.consul

    kafka:
      env_file: tesenv.env
      image: zimperium-dockerv2-local.jfrog.io/kafka:1.4.2
      container_name: kafka
      ports:
        - 9092:9092
        - 2181:2181
        - 9000:9000
        - 9001:9001
        - 2490:2490
        - 12345:12345
      depends_on:
        - consul
      volumes:
        - /data/zookeeper:/data/zookeeper
        - /data/kafka:/data/kafka
        - /data/shared_java_env:/shared_java_env
      networks:
        zmsnetwork:
          aliases:
            - kafka.service.consul

    device:
      env_file: tesenv.env
      image: zimperium-dockerv2-local.jfrog.io/device:6.2.1
      container_name: device
      ports:
        - 51888:8080
      depends_on:
        - consul
      networks:
        zmsnetwork:
          aliases:
            - device.service.consul
      volumes:
        - /data/shared_java_env:/shared_java_env

    email:
      env_file: tesenv.env
      image: zimperium-dockerv2-local.jfrog.io/email:1.5.3
      container_name: email
      ports:
        - 62888:8080
      depends_on:
        - consul
      networks:
        zmsnetwork:
          aliases:
            - email.service.consul
      volumes:
        - /data/shared_java_env:/shared_java_env

    user:
      env_file: tesenv.env
      image: zimperium-dockerv2-local.jfrog.io/user:4.0.6.2
      container_name: user
      ports:
        - 52888:8080
      depends_on:
        - consul
      networks:
        zmsnetwork:
          aliases:
            - user.service.consul
      volumes:
        - /data/shared_java_env:/shared_java_env

    tenant:
      env_file: tesenv.env
      image: zimperium-dockerv2-local.jfrog.io/tenant:3.1.4
      container_name: tenant
      ports:
        - 55888:8080
      depends_on:
        - consul
      networks:
        zmsnetwork:
          aliases:
            - tenant.service.consul
      volumes:
        - /data/shared_java_env:/shared_java_env

    trm:
      env_file: tesenv.env
      image: zimperium-dockerv2-local.jfrog.io/trm:3.4.12
      container_name: trm
      ports:
        - 63888:8080
      depends_on:
        - consul
      networks:
        zmsnetwork:
          aliases:
            - trm.service.consul
      volumes:
        - /data/shared_java_env:/shared_java_env

    threat:
      env_file: tesenv.env
      image: zimperium-dockerv2-local.jfrog.io/threat:1.4.2
      container_name: threat
      ports:
        - 56888:8080
      depends_on:
        - consul
      networks:
        zmsnetwork:
          aliases:
            - threat.service.consul
      volumes:
        - /data/shared_java_env:/shared_java_env

    threattype:
      env_file: tesenv.env
      image: zimperium-dockerv2-local.jfrog.io/threattype:1.1.7.1
      container_name: threattype
      ports:
        - 57888:8080
      depends_on:
        - consul
      networks:
        zmsnetwork:
          aliases:
            - threattype.service.consul
      volumes:
        - /data/shared_java_env:/shared_java_env

    facadefacade:
      env_file: tesenv.env
      image: zimperium-dockerv2-local.jfrog.io/facadefacade:5.2.18
      container_name: facadefacade
      ports:
        - 58888:8080
      depends_on:
        - consul
      networks:
        zmsnetwork:
          aliases:
            - facadefacade.service.consul
      volumes:
        - /data/shared_java_env:/shared_java_env

    operatingsystem:
      env_file: tesenv.env
      image: zimperium-dockerv2-local.jfrog.io/operatingsystem:1.0.7
      container_name: operatingsystem
      ports:
        - 60888:8080
      depends_on:
        - consul
      networks:
        zmsnetwork:
          aliases:
            - operatingsystem.service.consul
      volumes:
        - /data/shared_java_env:/shared_java_env

    eventreceiver:
      env_file: tesenv.env
      image: zimperium-dockerv2-local.jfrog.io/eventreceiver:1.6.0
      container_name: eventreceiver
      ports:
        - 64888:8080
      depends_on:
        - consul
      networks:
        zmsnetwork:
          aliases:
            - eventreceiver.service.consul
      volumes:
        - /data/shared_java_env:/shared_java_env

    dormancy:
      env_file: tesenv.env
      image: zimperium-dockerv2-local.jfrog.io/dormancy:6.0.6
      container_name: dormancy
      ports:
        - 5888:8080
        - 4123:4126
      depends_on:
        - consul
      networks:
        zmsnetwork:
          aliases:
            - dormancy.service.consul
      volumes:
        - /data/shared_java_env:/shared_java_env

    eventprocessor:
      env_file: tesenv.env
      image: zimperium-dockerv2-local.jfrog.io/eventprocessor:1.4.8.4
      container_name: eventprocessor
      ports:
        - 8732:8080
        - 4126:4126
      depends_on:
        - consul
      networks:
        zmsnetwork:
          aliases:
            - eventprocessor.service.consul
      volumes:
        - /data/shared_java_env:/shared_java_env

    pushnotification:
      env_file: tesenv.env
      image: zimperium-dockerv2-local.jfrog.io/pushnotification:1.5.16.1
      container_name: pushnotification
      ports:
        - 2453:8080
      depends_on:
        - consul
      volumes:
        - /home/linux/docker-config//znode/push-certs:/certificates
        - /data/shared_java_env:/shared_java_env
      networks:
        zmsnetwork:
          aliases:
            - pushnotification.service.consul

    # provides hawtio (good stuff, including camel route visualizer)
    control:
      env_file: tesenv.env
      image: zimperium-dockerv2-local.jfrog.io/control:1.0.5
      container_name: control
      depends_on:
        - consul
      ports:
        - 8086:8080
      networks:
        zmsnetwork:
          aliases:
            - control.service.consul
      volumes:
        - /data/shared_java_env:/shared_java_env

    redis:
      image: redis:2.8.6
      container_name: redis
      hostname: redis
      ports:
        - 6379:6379
      volumes:
        - /data/redis:/data
      networks:
        zmsnetwork:
          aliases:
            - redis.service.consul

    pgbouncer:
      env_file: tesenv.env
      image: zimperium-dockerv2-local.jfrog.io/pgbouncer:1.0
      container_name: pgbouncer
      ports:
        - 6432:6432
      volumes:
        - /home/linux/docker-config//znode/pgbouncer:/etc/pgbouncer
        - /data/logs/pgbouncer:/var/log/postgresql
      networks:
        zmsnetwork:
          aliases:
            - pgbouncer.service.consul

    content:
      env_file: tesenv.env
      image: zimperium-dockerv2-local.jfrog.io/content:5.7.17
      container_name: content
      hostname: content
      volumes:
        - /home/linux/docker-config//znode/content/nginx/sites-enabled:/etc/nginx/sites-enabled
        - /home/linux/docker-config//znode/certs:/usr/local/share/keys
        - /home/linux/docker-config//znode/reports:/reports
      networks:
        zmsnetwork:
          aliases:
            - content.service.consul

    memcached:
      image: memcached:latest
      container_name: memcached
      hostname: memcached
      ports:
        - 11211:11211
      networks:
        zmsnetwork:
          aliases:
            - memcached.service.consul

    zcloud:
      env_file: tesenv.env
      image: zimperium-dockerv2-local.jfrog.io/zcloud:5.7.48
      container_name: zcloud
      hostname: zcloud
      volumes:
        - /data/zee9:/srv/www/updates
        - /home/linux/docker-config//znode/zcloud/config:/znode/config
        - /home/linux/docker-config//znode/zcloud/apache2/ports.conf:/etc/apache2/ports.conf
        - /home/linux/docker-config//znode/zcloud/apache2/sites-enabled:/etc/apache2/sites-enabled
        - /home/linux/docker-config//znode/certs:/etc/apache2/keys
        - /data/logs/zcloud:/znode/logs
      depends_on:
        - zconsole
      networks:
        zmsnetwork:
          aliases:
            - zcloud.service.consul

    vpc-worker:
      env_file: tesenv.env
      image: zimperium-dockerv2-local.jfrog.io/zconsole:5.7.48
      container_name: vpc-worker
      hostname: vpc-worker
      volumes:
        - /home/linux/docker-config//znode/zconsole/config:/znode/config
        - /home/linux/docker-config//znode/zconsole/circus/vpc-worker.ini:/src/circus.ini
        - /data/logs/zconsole:/znode/logs
      depends_on:
        - redis
        - pgbouncer
        - memcached
        - pushnotification
        - dormancy
        - mdm-facade
        - consul
      networks:
        zmsnetwork:
          aliases:
            - vpc-worker.service.consul

    mdm-worker:
      env_file: tesenv.env
      image: zimperium-dockerv2-local.jfrog.io/zconsole:5.7.48
      container_name: mdm-worker
      hostname: mdm-worker
      volumes:
        - /home/linux/docker-config//znode/zconsole/config:/znode/config
        - /home/linux/docker-config//znode/zconsole/circus/mdm-worker.ini:/src/circus.ini
        - /data/logs/zconsole:/znode/logs
      depends_on:
        - redis
        - pgbouncer
        - memcached
        - pushnotification
        - dormancy
        - mdm-facade
        - consul
      networks:
        zmsnetwork:
          aliases:
            - mdm-worker.service.consul

    malware-worker:
      env_file: tesenv.env
      image: zimperium-dockerv2-local.jfrog.io/zconsole:5.7.48
      container_name: malware-worker
      hostname: malware-worker
      volumes:
        - /home/linux/docker-config//znode/zconsole/config:/znode/config
        - /home/linux/docker-config//znode/zconsole/circus/malware-worker.ini:/src/circus.ini
        - /data/logs/zconsole:/znode/logs
      depends_on:
        - redis
        - pgbouncer
        - memcached
        - pushnotification
        - dormancy
        - mdm-facade
        - consul
      networks:
        zmsnetwork:
          aliases:
            - malware-worker.service.consul

    notification-worker:
      env_file: tesenv.env
      image: zimperium-dockerv2-local.jfrog.io/zconsole:5.7.48
      container_name: notification-worker
      hostname: notification-worker
      volumes:
        - /home/linux/docker-config//znode/zconsole/config:/znode/config
        - /home/linux/docker-config//znode/zconsole/circus/notification-worker.ini:/src/circus.ini
        - /home/linux/docker-config//znode/reports:/reports
        - /data/logs/zconsole:/znode/logs
      depends_on:
        - redis
        - pgbouncer
        - memcached
        - pushnotification
        - dormancy
        - mdm-facade
        - consul
      networks:
        zmsnetwork:
          aliases:
            - notification-worker.service.consul

    stats-worker:
      env_file: tesenv.env
      image: zimperium-dockerv2-local.jfrog.io/zconsole:5.7.48
      container_name: stats-worker
      hostname: stats-worker
      volumes:
        - /home/linux/docker-config//znode/zconsole/config:/znode/config
        - /home/linux/docker-config//znode/zconsole/circus/stats-worker.ini:/src/circus.ini
        - /data/logs/zconsole:/znode/logs
      depends_on:
        - redis
        - pgbouncer
        - memcached
        - pushnotification
        - dormancy
        - mdm-facade
        - consul
      networks:
        zmsnetwork:
          aliases:
            - stats-worker.service.consul

    oauth2:
      env_file: tesenv.env
      image: zimperium-dockerv2-local.jfrog.io/zconsole:5.7.48
      container_name: oauth2
      hostname: oauth2
      volumes:
        - /home/linux/docker-config//znode/zconsole/circus/oauth2.ini:/src/circus.ini
        - /home/linux/docker-config//znode/certs:/usr/local/share/keys
        - /data/logs/zconsole:/znode/logs
      depends_on:
        - redis
        - pgbouncer
        - memcached
        - pushnotification
        - dormancy
        - mdm-facade
        - consul
      networks:
        zmsnetwork:
          aliases:
            - oauth2.service.consul

    vpc:
      env_file: tesenv.env
      image: zimperium-dockerv2-local.jfrog.io/zconsole:5.7.48
      container_name: vpc
      hostname: vpc
      volumes:
        - /home/linux/docker-config//znode/zconsole/config:/znode/config
        - /home/linux/docker-config//znode/zconsole/circus/vpc.ini:/src/circus.ini
        - /home/linux/docker-config//znode/zconsole/nginx/empty:/etc/nginx/sites-enabled
        - /home/linux/docker-config//znode/zconsole/nginx/sites-enabled/vpc:/etc/nginx/sites-enabled/vpc
        - /home/linux/docker-config//znode/certs:/usr/local/share/keys
        - /data/logs/zconsole:/znode/logs
      depends_on:
        - redis
        - pgbouncer
        - memcached
        - pushnotification
        - dormancy
        - mdm-facade
        - consul
      networks:
        zmsnetwork:
          aliases:
            - vpc.service.consul

    device-api:
      env_file: tesenv.env
      image: zimperium-dockerv2-local.jfrog.io/zconsole:5.7.48
      container_name: device-api
      hostname: device-api
      volumes:
        - /home/linux/docker-config//znode/zconsole/config:/znode/config
        - /home/linux/docker-config//znode/zconsole/circus/device-api.ini:/src/circus.ini
        - /home/linux/docker-config//znode/zconsole/static/stest.html:/home/wsgi/static/stest.html
        - /home/linux/docker-config//znode/zconsole/nginx/empty:/etc/nginx/sites-enabled
        - /home/linux/docker-config//znode/zconsole/nginx/sites-enabled/device-api:/etc/nginx/sites-enabled/device-api
        - /home/linux/docker-config//znode/certs:/usr/local/share/keys
        - /data/logs/zconsole:/znode/logs
      depends_on:
        - redis
        - pgbouncer
        - memcached
        - pushnotification
        - dormancy
        - mdm-facade
        - consul
      networks:
        zmsnetwork:
          aliases:
            - device-api.service.consul

    zpanel:
      env_file: tesenv.env
      image: zimperium-dockerv2-local.jfrog.io/zconsole:5.7.48
      container_name: zpanel
      hostname: zpanel
      volumes:
        - /home/linux/docker-config//znode/zconsole/config:/znode/config
        - /home/linux/docker-config//znode/zconsole/circus/zpanel.ini:/src/circus.ini
        - /home/linux/docker-config//znode/zconsole/nginx/empty:/etc/nginx/sites-enabled
        - /home/linux/docker-config//znode/zconsole/nginx/sites-enabled/zpanel:/etc/nginx/sites-enabled/zpanel
        - /home/linux/docker-config//znode/certs:/usr/local/share/keys
        - /data/logs/zconsole:/znode/logs
      depends_on:
        - redis
        - pgbouncer
        - memcached
        - pushnotification
        - dormancy
        - mdm-facade
        - consul
      networks:
        zmsnetwork:
          aliases:
            - zpanel.service.consul

    zconsole:
      env_file: tesenv.env
      image: zimperium-dockerv2-local.jfrog.io/zconsole:5.7.48
      container_name: zconsole
      hostname: zconsole
      volumes:
        - /home/linux/docker-config//znode/zconsole/config:/znode/config
        - /home/linux/docker-config//znode/zconsole/circus/zconsole.ini:/src/circus.ini
        - /home/linux/docker-config//znode/zconsole/nginx/empty:/etc/nginx/sites-enabled
        - /home/linux/docker-config//znode/zconsole/nginx/sites-enabled/zconsole:/etc/nginx/sites-enabled/zconsole
        - /home/linux/docker-config//znode/certs:/usr/local/share/keys
        - /home/linux/docker-config//znode/reports:/reports
        - /data/logs/zconsole:/znode/logs
      depends_on:
        - redis
        - pgbouncer
        - memcached
        - pushnotification
        - dormancy
        - mdm-facade
        - consul
      networks:
        zmsnetwork:
          aliases:
            - zconsole.service.consul


    acceptor:
      env_file: tesenv.env
      image: zimperium-dockerv2-local.jfrog.io/acceptor:5.7.48
      container_name: acceptor
      hostname: acceptor
      volumes:
        - /home/linux/docker-config//znode/acceptor/config:/znode/config
        - /home/linux/docker-config//znode/acceptor/circus/circus.ini:/src/circus.ini
        - /data/logs/acceptor:/znode/logs
      depends_on:
        - zconsole
        - mdm-facade
      networks:
        zmsnetwork:
          aliases:
            - acceptor.service.consul

    processor:
      env_file: tesenv.env
      image: zimperium-dockerv2-local.jfrog.io/processor:5.7.48
      container_name: processor
      hostname: processor
      volumes:
        - /home/linux/docker-config//znode/processor/config:/znode/config
        - /home/linux/docker-config//znode/processor/circus/circus.ini:/src/circus.ini
        - /data/logs/processor:/znode/logs
      depends_on:
        - zconsole
        - pushnotification
      networks:
        zmsnetwork:
          aliases:
            - processor.service.consul

    classifier:
      env_file: tesenv.env
      image: zimperium-dockerv2-local.jfrog.io/processor:5.7.48
      container_name: classifier
      hostname: classifier
      volumes:
        - /home/linux/docker-config//znode/classifier/config:/znode/config
        - /home/linux/docker-config//znode/classifier/circus/circus.ini:/src/circus.ini
        - /data/logs/classifier:/znode/logs
      networks:
        zmsnetwork:
          aliases:
            - classifier.service.consul

      networks:
        zmsnetwork:
          aliases:
            - zmdm.service.consul

    proxy:
      env_file: tesenv.env
      image: zimperium-dockerv2-local.jfrog.io/proxy:1.2
      container_name: proxy
      volumes:
        - /home/linux/docker-config//znode/certs/server.crt:/etc/server.crt
        - /home/linux/docker-config//znode/certs/server.key:/etc/server.key
        - /home/linux/docker-config//znode/certs/server.pem:/etc/server.pem
        - /home/linux/docker-config//znode/proxy/haproxy.cfg:/etc/haproxy.cfg
      ports:
        - 80:80
        - 443:443
        - 8888:8888
        - 8000:8000
        - 8080:8080
      depends_on:
        - zconsole
        - acceptor
        - zcloud
        - content
      networks:
        zmsnetwork:
          aliases:
            - proxy.service.consul

    mdm-facade:
      env_file: tesenv.env
      image: zimperium-dockerv2-local.jfrog.io/mdm-facade:2.9.15
      container_name: mdm-facade
      hostname: mdm-facade
      depends_on:
        - consul
      volumes:
        - /home/linux/docker-config//znode/mdm-facade/config:/facade/config
        - /data/logs/mdm-facade:/facade/logs
        - /data/shared_java_env:/shared_java_env
      ports:
        - 56789:8080
      networks:
        zmsnetwork:
          aliases:
            - mdm-facade.service.consul


    kong:
      env_file: tesenv.env
      image: zimperium-dockerv2-local.jfrog.io/kong:1.0.6
      container_name: kong
      ports:
        - 8100:8000
        - 8443:8443
        - 8001:8001
        - 7496:7496
      depends_on:
        - consul
      networks:
        zmsnetwork:
          aliases:
            - kong.service.consul

    kong-dashboard:
      env_file: tesenv.env
      image: pgbi/kong-dashboard:v1.3.0
      container_name: kong-dashboard
      ports:
        - 8082:8080
      depends_on:
        - consul
      networks:
        zmsnetwork:
          aliases:
            - kong-dashboard.service.consul

    rolesandpermissions:
      env_file: tesenv.env
      image: zimperium-dockerv2-local.jfrog.io/rolesandpermissions:1.1.9.3
      container_name: rolesandpermissions
      depends_on:
        - consul
        - kafka
      networks:
        zmsnetwork:
          aliases:
            - rolesandpermissions.service.consul
      volumes:
        - /data/shared_java_env:/shared_java_env


    tfa:
      env_file: tesenv.env
      image: zimperium-dockerv2-local.jfrog.io/tfa:2.0.6.1.1
      container_name: tfa
      ports:
        - 5988:8080
        - 5989:8081
      depends_on:
        - consul
      networks:
        zmsnetwork:
          aliases:
            - tfa.service.consul
      volumes:
        - /data/shared_java_env:/shared_java_env

    sms:
      env_file: tesenv.env
      image: zimperium-dockerv2-local.jfrog.io/sms:1.0.1.1
      container_name: sms
      ports:
        - 6648:8080
        - 35234:4126
      depends_on:
        - consul
      networks:
        zmsnetwork:
          aliases:
            - sms.service.consul
      volumes:
        - /data/shared_java_env:/shared_java_env

    malwareapi:
      env_file: tesenv.env
      image: zimperium-dockerv2-local.jfrog.io/malwareapi:1.3.4
      container_name: malwareapi
      depends_on:
        - consul
      networks:
        zmsnetwork:
          aliases:
            - malwareapi.service.consul
      ports:
        - 2455:8080
      volumes:
        - /data/shared_java_env:/shared_java_env

    collectionpolicy:
      env_file: tesenv.env
      image: zimperium-dockerv2-local.jfrog.io/collectionpolicy:1.0.6.2
      container_name: collectionpolicy
      depends_on:
        - consul
      networks:
        zmsnetwork:
          aliases:
            - collectionpolicy.service.consul
      volumes:
        - /data/shared_java_env:/shared_java_env

    appdirect:
      env_file: tesenv.env
      image: zimperium-dockerv2-local.jfrog.io/appdirect:3.0.5
      container_name: appdirect
      ports:
        - 6639:8080
      depends_on:
        - consul
      networks:
        zmsnetwork:
          aliases:
            - appdirect.service.consul
      volumes:
        - /data/shared_java_env:/shared_java_env

    burrow:
      env_file: tesenv.env
      image: jrnt30/burrow
      container_name: burrow
      volumes:
        - /home/linux/docker-config//znode/burrow/config:/etc/burrow
      ports:
        - 8600:8000
      depends_on:
        - kafka
      networks:
        zmsnetwork:
          aliases:
            - burrow.service.consul
