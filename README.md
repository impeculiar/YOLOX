Устанавливаем нужные дополнения
1. sudo apt install cmake
2. pip install -r requirements.txt
3. pip install -U .
4. python3 setup.py develop

Качаем модель по ссылке https://github.com/Megvii-BaseDetection/YOLOX/releases/download/0.1.1rc0/yolox_s.pth и вставляем ее в папку weights ( если нету то нужно создать )

# Создаем 3 картинки по кадрам 120,130,140

main.py -i assets/develop_streem.ts -o frame -f 120,130,140

# Обрабатываем 1 кадр через YOLOX

python3 tools/demo.py image -n yolox-s -c weights/yolox_s.pth --path assets/frame_120.jpg --conf 0.25 --nms 0.45 --tsize 640 --save_result --device cpu/gpu

# Обрабатываем 2 кадр через YOLOX

python3 tools/demo.py image -n yolox-s -c weights/yolox_s.pth --path assets/frame_130.jpg --conf 0.25 --nms 0.45 --tsize 640 --save_result --device cpu/gpu

# Обрабатываем 3 кадр через YOLOX

python3 tools/demo.py image -n yolox-s -c weights/yolox_s.pth --path assets/frame_140.jpg --conf 0.25 --nms 0.45 --tsize 640 --save_result --device cpu/gpu

# Обрабатываем видео через YOLOX

python3 tools/demo.py video -n yolox-s -c weights/yolox_s.pth --path assets/develop_streem.ts --conf 0.25 --nms 0.45 --tsize 640 --save_result --device cpu/gpu
