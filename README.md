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

### Docker run

crawler:

```
docker run -it --name crawler --rm -v /home/core/public:/data/web/public:rw hoshinotsuyoshi/crawler /start.sh
```

(in crawler container):

```
/vncserver.sh & /chrome-shot.rb "URL"
```

sinatra-app:

```
docker run -d --name web -p 8001:80 -v /home/core/public:/data/web/public:rw hoshinotsuyoshi/screenshot-web
```

(options `--name`,`-p 5901`(for debug) are optional)
