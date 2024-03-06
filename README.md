# PMSDNet
Recovering a clean background: A new progressive multi-scale CNN for image denoising (PMSDNet) by Jibin Deng*, Chaohua Hu has been accepted in Signal, Image and Video Processing, 2024.
 
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

https://www.dropbox.com/s/8j6b880m6ddxtee/TNRD-Codes.zip?dl=0&file_subpath=%2FTNRD-Codes%2FTrainingCodes4denoising%2FFoETrainingSets180

The color train dataset "BSD400" you can download here (Selected in the paper):

https://www2.eecs.berkeley.edu/Research/Projects/CS/vision/grouping/resources.html

The real-world train dataset "PolyU" you can download here (Selected in the paper):

https://github.com/csjunxu/PolyU-Real-World-Noisy-Images-Dataset

The real-world test dataset "Nam" you can download here (Selected in the paper):

https://github.com/GuoShi28/CBDNet/tree/master/testsets/Nam_patches

The real-world test dataset "CC" you can download here (Selected in the paper):

https://github.com/csjunxu/MCWNNM_ICCV2017

The real-world test dataset "DND" you can download here (Extra tested, no ground truth):

https://github.com/GuoShi28/CBDNet/tree/master/testsets/DND_patches

The real-world test dataset "SenseNoise" you can download here (Extra tested):

https://github.com/zhangyi-3/IDR or https://mycuhk-my.sharepoint.com/:f:/g/personal/1155135732_link_cuhk_edu_hk/Eqj2xo-jzTlChyuyF-JWmzQBdi5sLBrRZxQikdnko3EpfQ?e=81pFjp

# Deraining Datasets
The dataset "Rain100H" and "Rain100L" you can download here:

https://1drv.ms/f/s!AqLfQqtZ6GwGgep-hgjLxkov2SSZ3g