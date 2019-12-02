# DNS over TLS docker
create a dot server with docker

## clone this repository
```
git clone https://github.com/kamino-space/DoT-docker.git
```

## add your cert
Copy your .pem and .key file into config folder.  
Rename your cert files as cert.pem and cert.key or edit the unbound.conf.

## build image
```
cd DoT-docker
docker build -t dot:test .
```

## run container
```
docker run -d -p 53:53/udp -p 853:853 --restart always --name dns dot:test 
```

## test server
```
dig @x.x.x.x www.google.com -d
kdig +tls @x.x.x.x www.google.com -d
```