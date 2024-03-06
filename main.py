import av
from PIL import Image
import argparse

def save_frames(input_file, output_prefix, frame_numbers):
    container = av.open(input_file)
    for frame_number in frame_numbers:
        try:
            # Перемотка в начало файла
            container.seek(0)

            # Итерация по кадрам до нужного номера
            for i, frame in enumerate(container.decode(video=0)):
                if i == frame_number:
                    # Сохранение кадра в формате JPG с конвертацией цветового пространства
                    image = Image.fromarray(frame.to_ndarray(format='rgb24'))
                    image.save(f"assets/{output_prefix}_{frame_number}.jpg")
                    break
        except av.AVError:
            print(f"Ошибка при обработке кадра {frame_number}")
            break  # Прерываем цикл в случае ошибки

    container.close()

def parse_arguments():
    parser = argparse.ArgumentParser(description='Сохранение кадров из видео')
    parser.add_argument('-i', '--input', type=str, required=True, help='Путь к видеофайлу')
    parser.add_argument('-o', '--output_prefix', type=str, default='кадр', help='Префикс для сохраненных изображений')
    parser.add_argument('-f', '--frames', type=str, required=True, help='Номера кадров для сохранения, разделенные запятыми')

    ## main.py -i assets/develop_streem.ts -o frame -f 120,130,140

    args = parser.parse_args()
    args.frames = [int(frame_number) for frame_number in args.frames.split(',')]
    
    return args

if __name__ == "__main__":
    args = parse_arguments()

    save_frames(args.input, args.output_prefix, args.frames)
