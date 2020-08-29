In this readme  will explaine  how to  launch and synchronise the project

- Prerequise
	* Ensure to have mysql  an PHP > 7.2 installed on your computer

- to setup the project 
	* create a .env file inside the [ROOT]\api\store
	* copy the folowing code snippet and add your database information
		APP_NAME=Lumen
		APP_ENV=local
		APP_KEY=
		APP_DEBUG=true
		APP_URL=http://localhost
		APP_TIMEZONE=UTC

		LOG_CHANNEL=stack
		LOG_SLACK_WEBHOOK_URL=

		DB_CONNECTION=mysql
		DB_HOST=127.0.0.1
		DB_PORT=3306
		DB_DATABASE=store
		DB_USERNAME=root
		DB_PASSWORD=

		CACHE_DRIVER=file
		QUEUE_CONNECTION=sync
		
	*	Install composer 
	* run compeser install in the [ROOT]\api\store directory.
	

- to launch the project 
	* go the folder [ROOT]\api\store and launche the folowing command:
		php -S localhost:8000 -t public
		
- To synchronise the project 
	* Pull the target git branch
	* run the folowing cmd in the [ROOT]\api\store directory
		php artisan migrate

		

