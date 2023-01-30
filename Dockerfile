FROM mcr.microsoft.com/dotnet/sdk:7.0 as debug

#install debugger for NET Core
RUN apt-get update
RUN apt-get install -y unzip
RUN curl -sSL https://aka.ms/getvsdbgsh | /bin/sh /dev/stdin -v latest -l ~/vsdbg

RUN mkdir /src/
WORKDIR /src/

COPY ./src/testapp.csproj /src/testapp.csproj
RUN dotnet restore

COPY ./src/ /src/
RUN mkdir /out/
RUN dotnet publish --no-restore --output /out/ --configuration Release
EXPOSE 80
CMD dotnet run --urls "http://0.0.0.0:80"
