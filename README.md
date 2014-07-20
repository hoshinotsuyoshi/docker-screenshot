docker-screenshot
=================

## Development

###

### vnc:
password is password

### Usage in container:
/start.sh [url]

### Vagrant
Use this [Vagrantfile](https://github.com/coreos/coreos-vagrant)

Add sync-folder line in Vagrantfile like :

```
config.vm.synced_folder ".", "/home/core/share", id: "core", :nfs => true, :mount_options => ['nolock,vers=3,udp']
```

### Docker pull

```
docker pull hoshinotsuyoshi/screenshot:sinatra
```

### Docker run

like:

```
docker run -d --name shot -p 5901:5901 -p 8000:80 -v /home/core/share:/data/web/public:rw hoshinotsuyoshi/screenshot:sinatra "http://..."
```

(options `--name`,`5901`,`-v`(for debug) are optional)

