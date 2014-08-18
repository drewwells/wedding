ver = 0.5.0
test:
	echo "$(ver)"
deploy:
	npm install
	echo ">>> Building Ghost"
	rm -rf .build/build/*
	rm -rf .dist/build/*
	grunt release
	echo ">>> Deploying Ghost"
	scp .dist/release/Ghost-$(ver).zip do:/opt/wedding
	echo "cd /opt/wedding; su ghost; unzip -uo Ghost-$(ver).zip; rm -f Ghost-$VER.zip; npm install --production; npm update; sudo supervisorctl restart wedding" | ssh -o ServerAliveInterval=5 -o ServerAliveCountMax=1 -o ConnectTimeout=30 do
	cd ../
	echo ">>> Ghost built and deployed"
