<p align="center">Video upload 🎥🎞</p>

<p align="center">
  <a href="https://ruby-doc.org/core-2.7.3/">
    <img alt="Ruby Version" src="https://img.shields.io/badge/Ruby-2.7.3 -green.svg" target="_blank">
  </a>
  <a href="https://guides.rubyonrails.org/6_1_release_notes.html">
    <img alt="" src="https://img.shields.io/badge/Rails-~> 6.0.4-blue.svg" target="_blank">
  </a>
</p>


## Screenshot
![](https://github.com/RaquelLima7/LIMA_20220319/blob/master/app/assets/images/LIMA_20220319%20.gif)

## Stack the Project

- **Ruby on Rails**
- **Bootstrap**
- **Postgresql**
- **Docker**

## Project
Project in Rails that allows the user to add videos and thumbnails.
Videos must be mp4 or mov and have a maximum of 200MB.
When uploading a video, you must enter a category for it: exercise, education or recipe.
The system generates three files (64x64, 128x128, 256x256) for each thumbnail.
The project's home contains all the videos with the thumbnail, when you hover over the video, its name appears, and when you click the video starts.

## Building application

First you must have:

1. Postgres installed.

2. Ruby >= 2.7.3 installed.

As soon as you have everything done you can follow

### 1. Building everything

If you want to rock and create your dev environment and data, it's possible to go through the usual way:

1. And to *bundle* it with command:
```
bundle install
```

2. Create databases
```
rails db:create
```

3. Run migrations
```
rails db:migrate
```
4. Install imagemagick and ffmpeg

```
# Linux
sudo apt update
sudo apt install ffmpeg

#macOS
brew install ffmpeg
```
### 2. Building everything with docker

If you want to use Docker to create your development and data environment, you can follow the path below.

#### Necessary documentation:
- [Docker](https://docs.docker.com/engine/install/ubuntu/)
- [Docker Compose](https://docs.docker.com/compose/install/)

1. Building the project
```
docker-compose build
```

2. Start the application
```
docker-compose up
```

3. Create database
```
docker-compose run web rails db:create
```

4. Run migrations
```
docker-compose run web rails db:migrate
```
