docker-screenshot
=================

## Development

### vnc:
password is password

### Vagrant
Use this [Vagrantfile](https://github.com/hoshinotsuyoshi/coreos-vagrant/tree/for-screenshot)

Point:
Add sync-folder line in Vagrantfile like :

```
config.vm.synced_folder "./share", "/home/core/share", id: "core", :nfs => true, :mount_options => ['nolock,vers=3,udp']
```

### Usage

(トップ画面いけばわかる)

### Docker pull

```
docker pull hoshinotsuyoshi/screenshot:sinatra
```

### Docker run

like:

```
docker run -d --name shot -p 5901:5901 -p 8000:80 hoshinotsuyoshi/screenshot:sinatra
```

(options `--name`,`5901`(for debug) are optional)

