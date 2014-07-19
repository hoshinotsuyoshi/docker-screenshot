docker-screenshot
=================

## Development

###

### vnc:
password is password

### Usage in container:
/shot.sh [url]

### Vagrant
Use this [Vagrantfile](https://github.com/coreos/coreos-vagrant)

Add sync-folder line in Vagrantfile like :

```
config.vm.synced_folder ".", "/home/core/share", id: "core", :nfs => true, :mount_options => ['nolock,vers=3,udp']
```

### Docker run

like:

```
docker run -it --name shot --rm -p 5901:5901 -v /home/core/data:/data:rw hoshinotsuyoshi/screenshot "[url]"
```
