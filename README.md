# PMSDNet
Recovering a clean background: A new progressive multi-scale CNN for image denoising (PMSDNet) by Jibin Deng*, Chaohua Hu has been published in Signal, Image and Video Processing, 2024.
 
# Prerequisites:
python

tensorflow

keras

opencv-python

scikit-image

# Denoising Training
For train the PMSDNet, please run:

python mainimprovement.py

# Denoising Testing
**The pretrained models have been uploaded to the folder "pretrained_models".**

For test the PMSDNet, please run:

python mainimprovement.py --pretrain sigma (e.g., 15, 25, 35 and 50)/model_50.h5 --only_test True

# Denoising Datasets

The gray train dataset "Train400" you can download here (Selected in the paper):

https://download.csdn.net/download/qq_41104871/87646484

The color train dataset "BSD400" you can download here (Selected in the paper):

https://download.csdn.net/download/qq_41104871/87647333

# Deraining Datasets
The dataset "Rain100H" and "Rain100L" you can download here:

https://1drv.ms/f/s!AqLfQqtZ6GwGgep-hgjLxkov2SSZ3g