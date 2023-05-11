FROM python:3.9
RUN apt update && apt upgrade && apt install git curl ffmpeg libsm6 libxext6 -y
RUN git clone https://github.com/bes-dev/stable_diffusion.openvino.git stdiff
WORKDIR stdiff
RUN python -m pip install -r requirements.txt
RUN curl -O https://f004.backblazeb2.com/file/aai-blog-files/sd-v1-4.ckpt
RUN python /stdiff/demo.py --output /images/output.png --prompt "boot" # Boot strap the image
WORKDIR /images
ENTRYPOINT ["python", "/stdiff/demo.py", "--output", "/images/output.png", "--prompt"]
