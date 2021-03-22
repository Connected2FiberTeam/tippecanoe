### How to install Tippecanoe in Ubuntu

Install dependicies
```

	sudo apt-get install build-essential libsqlite3-dev zlib1g-dev

Install git
```

	sudo apt-get install git

Download tippecanoe
```

	git clone https://github.com/mapbox/tippecanoe.git

Go into Root Directory
```

	cd tippecanoe

Give make command
```

	sudo make

Finally, do install
```

	sudo make install


### How to install Tippecanoe in Centos

Install dependencies

```

	sudo yum install -y gcc automake autoconf libtool make

Install packages

```

	yum install -y gcc gcc-c++

Install sqlite
```

	yum install sqlite-devel.x86_64 -y

Install zlib
```

	yum install zlib-devel

Install git
```

	yum install git

Clone the repository
```

	git clone https://github.com/mapbox/tippecanoe.git

Go inside root directory
```

	cd tippecanoe

Give make command
```

	make

Finally, Install tippecanoe
```

	make install

Check version
```

	tippecanoe -v
	
```

Optional:
1. If you run as root user execute the below command and restart the server to reflect the changes

```sh

	export PATH=/usr/local/sbin:/sbin:/bin:/usr/sbin:/usr/bin:/root/bin:/usr/local/bin
	
```