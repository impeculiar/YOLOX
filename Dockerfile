# Dockerfile for Python script
FROM python:1.12.2

# Set the working directory
WORKDIR /app

# Copy the Python script to the container
COPY main.py /app/main.py

# Install dependencies
RUN pip3 install av pillow

# Command to run the script
CMD ["python3", "main.py -i assets/develop_streem.ts -o frame -f 120,130,140"]

# Dockerfile for YOLOX
FROM python:3.12.2

# Set the working directory
WORKDIR /app

# Clone the YOLOX repository
RUN git clone git@github.com:Megvii-BaseDetection/YOLOX.git

# Change to the YOLOX directory
WORKDIR /app/YOLOX

# Install YOLOX dependencies
RUN pip3 install -v -e .

# Command to run YOLOX (replace with the actual command to run YOLOX)
CMD ["python3", "tools/demo.py image -n yolox-s -c weights/yolox_s.pth --path assets/frame_120.jpg --conf 0.25 --nms 0.45 --tsize 640 --save_result --device cpu/gpu
"]

CMD ["python3", "tools/demo.py image -n yolox-s -c weights/yolox_s.pth --path assets/frame_130.jpg --conf 0.25 --nms 0.45 --tsize 640 --save_result --device cpu/gpu
"]

CMD ["python3", "tools/demo.py image -n yolox-s -c weights/yolox_s.pth --path assets/frame_140.jpg --conf 0.25 --nms 0.45 --tsize 640 --save_result --device cpu/gpu
"]

CMD ["python3", "python tools/demo.py video -n yolox-s -c weights/yolox_s.pth --path assets/develop_streem.ts --conf 0.25 --nms 0.45 --tsize 640 --save_result --device cpu/gpu"]

