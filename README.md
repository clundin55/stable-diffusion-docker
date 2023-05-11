# README

This Dockerfile builds an image based on the `python:3.9` image, with additional software and dependencies required to run the `stable_diffusion` repository, which is cloned from `https://github.com/bes-dev/stable_diffusion.openvino.git`.

## Requirements

- Docker must be installed on your machine.

## Build the Image

To build the Docker image, navigate to the directory that contains the Dockerfile and run the following command:

```bash
docker build -t stdiff-image .
```

This command builds the Docker image and tags it with the name `stdiff-image`.

## Run the Container

To run the Docker container, execute the following command:

```bash
docker run --rm -v $PWD/images:/images stdiff-image "boot"
```

This command runs the `stdiff` container with the `"boot"` prompt and mounts the `./images` directory in the container's `/images` directory. This is done so that the output images can be accessed on your machine.

## Explanation of the Dockerfile

### Base Image

This Dockerfile starts with the official `python:3.9` image.

### Install Dependencies

The next step is to install the dependencies required to run `stdiff` and other libraries. The following packages are installed using `apt`:

- `git` for cloning the `stdiff` repository.
- `curl` for downloading the pre-trained model.
- `ffmpeg` for video conversion.
- `libsm6` and `libxext6` for OpenCV image processing.

### Clone `stdiff` Repository

The `stdiff` repository is then cloned from `https://github.com/bes-dev/stable_diffusion.openvino.git`.

### Install Python Libraries

The `requirements.txt` file is used to install the necessary Python libraries using `pip`.

### Download Pre-Trained Model

The pre-trained model is downloaded from `https://f004.backblazeb2.com/file/aai-blog-files/sd-v1-4.ckpt`.

### Bootstrap the Image

The `demo.py` script is run with the `--prompt "boot"` argument to bootstrap the image.

### Set Working Directory

The working directory is set to `/images`, where the output images will be saved.

### Set Entry Point

Finally, the entry point is set to `["python", "/stdiff/demo.py", "--output", "/images/output.png", "--prompt"]` to execute the `demo.py` script with the appropriate arguments when the container is run.
