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

The final assignment is split into two parts:

- **Part 1** — Compare MLP and CNN architectures on CIFAR-10 and Fashion-MNIST
- **Part 2** — Real-world image classification on two Kaggle datasets using transfer learning with EfficientNetB0

Each notebook is available in both a `local/` version and a `colab/` version.

---

## 📁 Structure

```
Final_Assignment/
├── part1/
│   ├── local/
│   │   ├── CIFAR10-MLP.ipynb
│   │   ├── CIFAR10-CNN.ipynb
│   │   ├── FashionMNIST-MLP.ipynb
│   │   └── FashionMNIST-CNN.ipynb
│   └── colab/
│       ├── CIFAR10-MLP.ipynb
│       ├── CIFAR10-CNN.ipynb
│       ├── FashionMNIST-MLP.ipynb
│       └── FashionMNIST_CNN.ipynb
├── part2/
│   ├── satellite_environment/
│   │   ├── local/IntelScenes.ipynb
│   │   └── colab/IntelScenes.ipynb
│   └── wild_animals/
│       ├── local/WildAnimals.ipynb
│       └── colab/WildAnimals.ipynb
└── README.md
```

---

## 🎯 Part 1: CIFAR-10 & Fashion-MNIST

### Datasets

**CIFAR-10:** 60,000 color images (32×32×3), 10 classes — airplane, automobile, bird, cat, deer, dog, frog, horse, ship, truck. Split: 50K train / 10K test.

**Fashion-MNIST:** 70,000 grayscale images (28×28), 10 classes — T-shirt, Trouser, Pullover, Dress, Coat, Sandal, Shirt, Sneaker, Bag, Ankle boot. Split: 60K train / 10K test.

### CIFAR-10 MLP (`CIFAR10-MLP.ipynb`)

| Architecture | Hidden Layers | Regularization |
|---|---|---|
| Logistic Regression | None (linear) | — |
| Shallow MLP | 512 units, ReLU | — |
| Deep MLP | 1024 → 512 → 256, ReLU | BatchNorm + Dropout + Early Stopping |

**Key Finding:** No matter how deep the MLP, it struggles on CIFAR-10 — flattening a 32×32×3 image into a 3072-dim vector loses all spatial context.

### CIFAR-10 CNN (`CIFAR10-CNN.ipynb`)

- **Custom CNN** — 3 convolutional blocks from scratch, tested with and without regularization
- **VGG19 Transfer Learning** — pre-trained ImageNet weights, two-phase fine-tuning on CIFAR-10

**Key Finding:** CNNs dramatically outperform MLPs by exploiting spatial structure. Transfer learning with VGG19 gives a significant boost even on low-resolution 32×32 images.

### Fashion-MNIST MLP (`FashionMNIST-MLP.ipynb`)

| Architecture | Hidden Layers | Regularization |
|---|---|---|
| Logistic Regression | None (linear) | — |
| Shallow MLP | 256 units | — |
| Deep MLP | 512 → 256 → 128 | Dropout + BatchNorm + Early Stopping |

Evaluated with both **SGD** and **Adam** optimizers.

**Key Finding:** Fashion-MNIST is tractable for MLPs. Depth + Dropout + Adam is the winning combination.

### Fashion-MNIST CNN (`FashionMNIST-CNN.ipynb`)

| Architecture | Conv Blocks | Filters | Dense Head |
|---|---|---|---|
| Small CNN | 2 | 8, 16 | Direct output |
| Deep CNN | 3 | 32, 64, 128 | 256 units + BatchNorm + Dropout |

**Key Finding:** Even a tiny 2-block CNN comfortably outperforms the best MLP on Fashion-MNIST.

---

## 🎯 Part 2: Real-World Image Classification

### Intel Natural Scenes (`satellite_environment/`)

**Task:** Classify natural scene images into 6 categories.

**Dataset:** [Intel Image Classification](https://www.kaggle.com/datasets/puneet6060/intel-image-classification)
- ~25,000 images at 150×150 pixels
- 6 classes: buildings, forest, glacier, mountain, sea, street
- Pre-split: `seg_train/` (~14K) and `seg_test/` (~3K)

**Approach:**
- **Custom CNN** — designed from scratch for scene recognition
- **EfficientNetB0 Transfer Learning** — pre-trained ImageNet weights, fine-tuned on Intel scenes with two-phase training and `ReduceLROnPlateau`

**Why EfficientNetB0?** It achieves strong accuracy with far fewer parameters than VGG-style networks — ideal when compute is limited and images are already high quality.

### Wild Animal Species (`wild_animals/`)

**Task:** Classify images into 90 wild animal species.

**Dataset:** [Animal Image Dataset (90 Animals)](https://www.kaggle.com/datasets/iamsouravbanerjee/animal-image-dataset-90-different-animals)
- 5,400 images across 90 classes (60 images per class)
- Images sourced from Google Images

**Approach:**
- **Custom CNN** — baseline from scratch
- **EfficientNetB0 Transfer Learning** — fine-tuned at 224×224 resolution with two-phase training

**Why it's hard:** 90 classes with only 60 images each is extremely limited data — transfer learning is essentially required to get reasonable performance.

---

## Key Concepts

- **MLP vs CNN:** MLPs flatten images and lose spatial information; CNNs use local filters to detect edges and shapes hierarchically
- **Transfer Learning:** Reuse representations from large datasets (ImageNet) — critical when your own dataset is small
- **Two-Phase Training:** Freeze the base first, train the head, then unfreeze and fine-tune with a low learning rate to avoid destroying pre-trained weights
- **EfficientNetB0:** Compound scaling of depth, width, and resolution — achieves high accuracy with fewer parameters than VGG-style networks
- **ReduceLROnPlateau:** Automatically reduces learning rate when validation loss stagnates — helps escape local minima in later training stages
- **BatchNormalization / Dropout / Early Stopping:** Core regularization toolkit to prevent overfitting

---

## Technologies

- **Framework:** TensorFlow 2.x, Keras Functional API
- **Architectures:** MLP, Custom CNN, VGG19, EfficientNetB0
- **Optimizers:** SGD, Adam
- **Regularization:** Dropout, BatchNormalization, Early Stopping, ReduceLROnPlateau
- **Datasets:** CIFAR-10, Fashion-MNIST, Intel Scenes, Wild Animals (90 species)
- **Environment:** Google Colab with GPU acceleration / Local
