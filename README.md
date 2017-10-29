

## ASP.NET Core 2.0 + SQL Server on Docker with VSCode Debug

This project is designed to give a scaffolding inside which any .NET Core 2.0 ASP.NET application can be developed, debugged and deployed using Docker. Just follow the step by step instructions and have a ASP.NET Core 2.0 app dev enviorment ready in no time. 

### What it does
It basically creates 3 containers, one for development, one for debugging and one SQL Server container. It keeps the debugging container on all the time and allows for a quick publish and debug workflow..

***Disclaimer:** I have only tested this on a macOS host, I trust it should work just as well under a Linux host although I am not sure how it will behave on Windows, should not be too difficult perhaps few commands would be different.*

### Before you start
- Make sure you have "dotnet" installed and accessible from your terminal. If not then head on over to https://www.microsoft.com/net/core and get an installation for your OS.
- Make sure you have docker installed on your system.
- This setup is meant to work with Visual Studio Code, not Visual Studio

### How to use
1. Clone the repository
2. Open ./src folder in your terminal
3. Create a new ASP.NET Core app inside ./src run `dotnet new mvc -n App` in terminal
	- Replace `mvc` with your needed ASP.NET template (https://docs.microsoft.com/en-us/dotnet/core/tools/dotnet-new?tabs=netcore2x)
	- Replace `App` with whatever you want to call your app
4. Now you will have a somthing like this ./src/App/[generated files]
5. Move everything in /App folder to ./src folder -> ./src/[generated files] and delete the ./App folder, don't need it.
6. Go to the root of the repository where the Dockerfiles are and run `docker-compose up --build`
	- Once completed, your site is now accessable on http://localhost:8000 hosted inside docker
6. Now to setup the debugger: Open the project in VSCode
	- You can do a `dotnet restore` from your host terminal inside the ./src folder, will fix the broken intellisense
7. Open .vscode/launch.json
	- Replace `"program": "/app/[ENTER APP NAME HERE].dll"` with your app's name "App.dll" example.
8. Open .vscode/tasks.json
	- Replace both `"${workspaceRoot}/src/[ENTER APP NAME HERE].csproj"` with your app's name "App.csproj" example.

That's it! Now go into ./src/Controllers And set a breakpoint in one of the actions you want to hit, and press F5. The debugger should spin put and let you debug inside of Docker.



