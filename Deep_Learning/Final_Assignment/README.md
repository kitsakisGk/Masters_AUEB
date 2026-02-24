# Deep Learning — Final Assignment

<div align="center">

![Python](https://img.shields.io/badge/Python-3.x-blue?logo=python&logoColor=white)
![TensorFlow](https://img.shields.io/badge/TensorFlow-2.x-orange?logo=tensorflow&logoColor=white)
![Keras](https://img.shields.io/badge/Keras-Functional_API-red?logo=keras&logoColor=white)
![Google Colab](https://img.shields.io/badge/Google_Colab-Notebook-yellow?logo=googlecolab&logoColor=white)

**Author:** Georgios Kitsakis
**Institution:** Athens University of Economics and Business (AUEB)

</div>

---

## Overview

Final assignment comparing MLP and CNN architectures on two image classification datasets: CIFAR-10 and Fashion-MNIST. Each dataset is tackled with both a fully connected (MLP) and a convolutional (CNN) approach, allowing direct comparison of the two paradigms.

---

## Datasets

### CIFAR-10
- 60,000 color images (32×32×3)
- 10 classes: airplane, automobile, bird, cat, deer, dog, frog, horse, ship, truck
- Split: 50,000 train / 10,000 test

### Fashion-MNIST
- 70,000 grayscale images (28×28)
- 10 classes: T-shirt, Trouser, Pullover, Dress, Coat, Sandal, Shirt, Sneaker, Bag, Ankle boot
- Split: 60,000 train / 10,000 test

---

## Notebooks

### CIFAR-10 MLP (`CIFAR10-MLP.ipynb`)
Three MLP architectures compared:
- **Logistic Regression** — linear baseline (no hidden layers)
- **Shallow MLP** — 1 hidden layer, 512 units, ReLU
- **Deep MLP** — 3 hidden layers (1024 → 512 → 256), BatchNorm, Dropout, Early Stopping

### CIFAR-10 CNN (`CIFAR10-CNN.ipynb`)
Two CNN approaches:
- **Custom CNN** — 3 convolutional blocks designed from scratch
- **VGG19 Transfer Learning** — pre-trained ImageNet weights, fine-tuned on CIFAR-10

### Fashion-MNIST MLP (`FashionMNIST-MLP.ipynb`)
Three MLP architectures with both SGD and Adam optimizers:
- **Logistic Regression** — linear baseline
- **Shallow MLP** — 1 hidden layer, 256 units
- **Deep MLP** — 3 hidden layers (512 → 256 → 128), Dropout, BatchNorm

### Fashion-MNIST CNN (`FashionMNIST-CNN.ipynb`)
Two CNN architectures with and without regularization:
- **Small CNN** — 2 convolutional blocks (8, 16 filters)
- **Deep CNN** — 3 convolutional blocks (32, 64, 128 filters) + dense head, BatchNorm, Dropout
