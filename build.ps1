$ErrorActionPreference = 'Stop';
Write-Host Starting build

if ($isWindows) {
  docker build --pull -t alpine-mosquitto -f Dockerfile.windows .
} else {
  docker build -t alpine-mosquitto --build-arg "arch=$env:ARCH" .
}

docker images
