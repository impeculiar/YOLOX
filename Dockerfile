# Используем базовый образ Python 3.10.12
FROM python:latest

# Устанавливаем необходимые зависимости
RUN apt-get update && apt-get install -y \
    git \
    cmake \
    build-essential \
    libgl1-mesa-glx

# Переходим в директорию YOLOX
WORKDIR /YOLOX
COPY . .

# Устанавливаем зависимости Python
RUN pip install -r requirements.txt

# Собираем YOLOX
RUN python setup.py develop

# Указываем команду по умолчанию при запуске контейнера
CMD ["bash"]
