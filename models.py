from keras.models import Model
from keras.layers import Input, Add,Subtract, PReLU, Conv2DTranspose, \
    Concatenate, MaxPooling2D, UpSampling2D, Dropout, concatenate, GlobalAveragePooling2D,\
    Reshape, Dense, Multiply, Activation
from keras.layers.convolutional import Conv2D
from keras import backend as K
import tensorflow as tf
import os

def PMSDNet():
    inpt = Input(shape=(None,None,1))
    #layer 1
    x = Conv2D(filters=64, kernel_size=(3,3), strides=(1,1), padding='same')(inpt)
    x = PReLU(shared_axes=[1,2])(x)
    s0 = x
    x = Conv2D(filters=64, kernel_size=(3,3), strides=(1,1), padding='same')(x)
    x = PReLU(shared_axes=[1,2])(x)
    s1 = x
    for i in range(5):
        x0 = Conv2D(filters=64, kernel_size=(3,3), strides=(1,1), padding='same', dilation_rate=(1,1))(s1)
        x1 = Conv2D(filters=64, kernel_size=(3,3), strides=(1,1), padding='same', dilation_rate=(3,3))(s1)
        x1 = PReLU(shared_axes=[1,2])(x1)
        x2 = Conv2D(filters=64, kernel_size=(3,3), strides=(1,1), padding='same', dilation_rate=(5,5))(s1)
        x2 = PReLU(shared_axes=[1,2])(x2)
        x01 = concatenate([x0,x1],axis=-1)
        x01 = Conv2D(filters=64, kernel_size=(1,1), strides=(1,1), padding='same')(x01)
        x01 = PReLU(shared_axes=[1,2])(x01)
        x012 = concatenate([x01,x2],axis=-1)
        x012 = Conv2D(filters=64, kernel_size=(1,1), strides=(1,1), padding='same')(x012)
        pixel = Dense(4, activation='relu', use_bias=False)(x012)
        pixel = Dense(1, activation='sigmoid', use_bias=False)(pixel) 
        pixel = Multiply()([x012, pixel])
        s1 = Add()([pixel, s1])
    x = Conv2D(filters=64, kernel_size=(3,3), strides=(1,1), padding='same')(s1)
    x = PReLU(shared_axes=[1,2])(x)
    x = Add()([x, s0])
    x = Conv2D(filters=64, kernel_size=(3,3), strides=(1,1), padding='same')(x)
    x = PReLU(shared_axes=[1,2])(x)
    x = Conv2D(filters=1, kernel_size=(3,3), strides=(1,1), padding='same')(x)  # gray is 1 color is 3
    o = Subtract()([inpt, x])
    model = Model(inputs=inpt, outputs=o)
    # model.summary() # print the size of model
    # GFLOPs, Params
    # x = torch.randn(1,1,50,50)
    # flops, params = thop.profile(PMSDNet(),inputs=(x,))
    # print(flops/1e9, params/1e6)
    return model

# In this way, you can print the GFLOPs, Params
# PMSDNet()