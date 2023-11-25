# PMSDNet
This website shares the code of the "A new progressive multi-scale CNN for image denoising" finished by Jibin Deng*, Chaohua Hu, Signal, Image and Video Processing, 2023.
 
# Prerequisites:

python == 3.6.2

tensorflow == 2.0.0

keras == 2.3.1

opencv-python == 4.5.5.62

scikit-image == 0.17.2

# Denoising Training
For train the PMSDNet, please run:

python mainimprovement.py

# Denoising Testing
For test the PMSDNet, please run:

python mainimprovement.py --pretrain sigma/model_50.h5 --only_test True

# Denoising Datasets
The gray train dataset "Train400" you can download here:

https://download.csdn.net/download/qq_41104871/87646484

The color train dataset "BSD400" you can download here:

https://download.csdn.net/download/qq_41104871/87647333

The real-world train dataset "PolyU" you can download here:

https://github.com/csjunxu/PolyU-Real-World-Noisy-Images-Dataset

# Deraining Datasets
The dataset "Rain100H" and "Rain100L" you can download here:

https://1drv.ms/f/s!AqLfQqtZ6GwGgep-hgjLxkov2SSZ3g