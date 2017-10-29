FROM microsoft/aspnetcore-build:2.0.2-stretch
RUN mkdir app
COPY entrypoint.sh /
COPY ./src/*.csproj /app
WORKDIR /app
RUN ["dotnet", "restore"]
WORKDIR /
EXPOSE 80/tcp
RUN chmod +x ./entrypoint.sh
CMD /bin/bash ./entrypoint.sh