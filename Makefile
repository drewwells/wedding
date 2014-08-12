deploy:
	npm install
	echo ">>> Building Ghost"
	#rm -rf .build/build/*
	#rm -rf .dist/build/*
	#grunt release
	#echo ">>> Deploying Ghost"
	scp .dist/release/Ghost-0.4.2.zip do:/opt/wedding
	echo "cd /opt/wedding; su ghost; unzip -uo Ghost-0.4.2.zip; rm -f Ghost-0.4.2.zip; npm install --production; npm update; sudo supervisorctl restart wedding" | ssh -o ServerAliveInterval=5 -o ServerAliveCountMax=1 -o ConnectTimeout=30 do
	cd ../
	echo ">>> Ghost built and deployed"
