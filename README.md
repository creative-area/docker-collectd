# Collectd with Docker

**Collectd** container with [docker-collectd-plugin](https://github.com/lebauce/docker-collectd-plugin).

This uses the **Docker API** to report stats for each container on the host.

The following container stats are reported:
- Network bandwidth
- Memory usage
- CPU usage
- Block IO

The name of the container is used for the `plugin_instance` dimension.

In this setup, Collectd is configured to send data to a **Logstash** instance.

## Usage

```bash
sudo docker run \
  --volume=/var/run/docker.sock:/var/run/docker.sock \
  --detach=true \
  --name=collectd \
	--env LOGSTASH_SERVER=[CUSTOM_IP] \
	--env LOGSTASH_PORT=25826 \
  creativearea/collectd
```
