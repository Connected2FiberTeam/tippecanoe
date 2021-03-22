### How to install Tippecanoe in Ubuntu

Install dependicies
```

	sudo apt-get install build-essential libsqlite3-dev zlib1g-dev

Use scripts to build for the local environment OS
```

	tools/build.sh

Package the application
```

	tools/package.sh


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

Use scripts to build for the local environment OS
```

    tools/build.sh

Package the application
```

    tools/package.sh

Check version
```

	tippecanoe -v
	
