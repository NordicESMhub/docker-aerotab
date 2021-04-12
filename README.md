# Docker container for AeroTab
Dockerfile for creating the aerosol look-up tables used by NorESM CAM

## Pull the docker image
```
docker pull quay.io/nordicesmhub/docker-aerotab:0.0.1
```
## Create a folder on your computer (to hold the look-up tables outside the container), for instance 
```
mkdir -p $HOME/archive
```
## Start the container and "bind" the folder you created to that inside the container
```
docker run -td -v $HOME/archive:/opt/uio/archive quay.io/nordicesmhub/docker-aerotab:0.0.1
```
### Take note of the unique identifier for this container (the first 3 letters are generally sufficient), for example
```
8d61ca497dd66a9e30eecc0a65f82c86b1f606fae23faa982bf35211eed16a00
```
### Run the container
```
docker exec -it 8d6 bash
```

### to create:

#### the short wavelengths look-up tables
```
./opt/uio/create_sw_lut 
```

(This compiles the code with the default options and loops through the various input parameters for each aerosol mode to produce the kcomp 0 to 10. 
It also creates other tables, namely aerocomk and aerodryk, which are used by NorESM when additional diagnostics are required.)

#### the long wavelengths look-up tables
```
./opt/uio/create_lw_lut 
```
(This makes the necessary change in the settings, then compiles the code and loops through the various input parameters for each aerosol mode to produce the lwkcomp 0 to 10)

#### the log-normal distributions look-up tables
```
./opt/uio/create_lnd_lut 
```
(similar as for LW but for the log-normal distributions tables logntilp 1 to 10).

