RIA_Projekt_G1
Rich Internet Application Abschlussprojekt erstellt von Roitinger Michael, Moder Stefan und Hofer Christian

Quick Start

    1. install via npm
        npm install

    2. adjust configuration in config.json file
        port: chose a free port between 1024 and 65535
        loggerLevel: choose one of the following levels:
            error, warn, info, verbose, debug, silly
            further information on https://github.com/winstonjs/winston

    3. start server via npm
        npm start

Testing

    to create some test go into the directory "test" and write some into test.js
    1. start test with
        npm test

What is RIA_Projekt_G1

    RIA_Projekt_G1 is a example server system which keep different servers available which every student needs maybe every day.
    After running the System it is possible to create an account. After login you can choose between different services.
    The Home contains different small information what you will find under the links "Stundenplan", "Noten", "Map", "Chat".
    Studenplan contains a frame of the original schedular-service under "http://almaty.fh-joanneum.at/stundenplan/"
    In "Noten" you can retrieve your grades, after fill in your credentials and click the send button the grades-worker will
    download your grades and give you an overview of it.
    "Map" is what you think and "Chat" is a small chat-service which offers the possibility to chat with everybody who is logged in.
    The chat also offers a history so past conversations are stored locally on your pc.


Outlook

    Some improvements:
    1.) Database for registration and login
    2.) Database for chat - history
    3.) Chat Section for e.g. study path, year and groups
    4.) Possibility for private chat
    5.) video chat
    6.) integration to online administration tool (actions)
    7.) notifications for new added grades
    8.) notifications for new chat messages
    9.) moodle integration
    10.) own design for every study path




