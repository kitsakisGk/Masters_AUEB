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

Final assignment comparing MLP and CNN architectures on two image classification datasets: CIFAR-10 and Fashion-MNIST. Each dataset is tackled with both a fully connected (MLP) and a convolutional (CNN) approach.

The goal is not just to get good accuracy — it's to understand **why** certain architectures work better than others depending on the data, and **why** specific design choices (depth, regularization, optimizer) matter.

---

## Datasets

### CIFAR-10
- 60,000 color images (32×32×3), 10 classes
- Classes: airplane, automobile, bird, cat, deer, dog, frog, horse, ship, truck
- Split: 50,000 train / 10,000 test
- **Why it's hard:** Color images with complex backgrounds and only 32×32 resolution. Classes like cat vs dog are visually similar. MLPs fail here because flattening destroys the spatial relationships between pixels that make objects recognizable.

### Fashion-MNIST
- 70,000 grayscale images (28×28), 10 classes
- Classes: T-shirt, Trouser, Pullover, Dress, Coat, Sandal, Shirt, Sneaker, Bag, Ankle boot
- Split: 60,000 train / 10,000 test
- **Why we use it:** A harder drop-in replacement for MNIST. Fashion items have more varied shapes and textures than digits, making it a more realistic benchmark while still being tractable for MLPs.

---

## Notebooks

### CIFAR-10 MLP (`CIFAR10-MLP.ipynb`)

Three MLP architectures compared to show the impact of depth and regularization:

| Architecture | Hidden Layers | Regularization |
|---|---|---|
| Logistic Regression | None (linear) | — |
| Shallow MLP | 512 units, ReLU | — |
| Deep MLP | 1024 → 512 → 256, ReLU | BatchNorm + Dropout + Early Stopping |

**Why these architectures?** The logistic regression baseline shows the ceiling of linear models. The shallow MLP tests whether a single non-linear layer helps. The deep MLP adds BatchNorm and Dropout to see if regularization can compensate for the inherent limitation of MLPs on image data.

**Key Finding:** No matter how deep the MLP, it struggles on CIFAR-10 — flattening a 32×32×3 image into a 3072-dim vector loses all spatial context. A pixel next to another pixel means nothing to a fully connected layer.

---

### CIFAR-10 CNN (`CIFAR10-CNN.ipynb`)

Two CNN approaches:
- **Custom CNN** — 3 convolutional blocks designed from scratch, tested with and without regularization
- **VGG19 Transfer Learning** — pre-trained ImageNet weights, fine-tuned on CIFAR-10 using a two-phase strategy:
  1. Train only the custom classification head (VGG19 frozen)
  2. Fine-tune the entire network with a very low learning rate

**Why CNNs work where MLPs fail:** Convolutional filters slide across the image looking for local patterns (edges, corners, textures) — the same filter detects a horizontal edge anywhere in the image (translation invariance). This is exactly how we recognize objects: by their local features, not by which pixel position they occupy.

**Why transfer learning?** VGG19 was trained on 1.2M ImageNet images and has already learned to detect edges, textures, and object parts. Fine-tuning it on CIFAR-10 is far more efficient than learning all these representations from scratch with only 50K images.

**Why two-phase training?** Training the head first (frozen base) prevents the pre-trained weights from being destroyed by large gradient updates from a randomly initialized head. Once the head is stable, we unfreeze everything and fine-tune with a tiny learning rate so we only nudge the representations, not overwrite them.

---

### Fashion-MNIST MLP (`FashionMNIST-MLP.ipynb`)

Three MLP architectures, each evaluated with both **SGD** and **Adam** optimizers:

| Architecture | Hidden Layers | Regularization |
|---|---|---|
| Logistic Regression | None (linear) | — |
| Shallow MLP | 256 units | — |
| Deep MLP | 512 → 256 → 128 | Dropout + BatchNorm + Early Stopping |

**Why compare SGD vs Adam?** SGD uses a fixed learning rate for all parameters, which makes it sensitive to the learning rate choice and slow to converge. Adam adapts the learning rate per parameter based on gradient history — it effectively gives a bigger step to infrequently updated weights and a smaller step where gradients are noisy. This makes Adam more robust and typically faster.

**Why does depth help here (unlike CIFAR-10)?** Fashion-MNIST is grayscale and simpler — a sandal and a sneaker differ mostly in overall shape, not fine color texture. More hidden layers let the network learn a richer feature hierarchy from the flattened pixel values, which is sufficient for this task.

**Key Finding:** Fashion-MNIST is tractable for MLPs. Depth + Dropout + Adam is the winning combination.

---

### Fashion-MNIST CNN (`FashionMNIST-CNN.ipynb`)

Two CNN architectures tested with and without regularization and Early Stopping:

| Architecture | Conv Blocks | Filters | Dense Head |
|---|---|---|---|
| Small CNN | 2 | 8, 16 | Direct output |
| Deep CNN | 3 | 32, 64, 128 | 256 units + BatchNorm + Dropout |

**Why go from 8→16 or 32→64→128 filters?** Early layers detect simple patterns (edges, gradients) — you don't need many filters for that. Deeper layers combine these into complex shapes and need more filters to represent the growing variety of high-level features. Increasing filter count with depth is a standard design principle.

**Why does even a small CNN beat the best MLP here?** Because convolutions respect the 2D structure of images. A trouser has vertical edges and a specific aspect ratio — a CNN detects this regardless of where it appears in the frame. An MLP would need to memorize all possible positions separately.

**Key Finding:** Even a tiny 2-block CNN comfortably outperforms the best MLP on Fashion-MNIST. The deep CNN with regularization achieves the best generalization.

---

## Key Concepts

- **MLP vs CNN:** MLPs flatten images and lose spatial information; CNNs use local filters to detect edges, textures and shapes hierarchically — the same filter works anywhere in the image (translation invariance)
- **BatchNormalization:** Normalizes layer inputs during training, reducing internal covariate shift. This lets us use higher learning rates and makes training more stable
- **Dropout:** Randomly deactivates neurons during training, forcing the network to learn redundant representations and preventing over-reliance on specific neurons (reduces overfitting)
- **Early Stopping:** Monitors validation loss and halts training when it stops improving — prevents overfitting without manually tuning the number of epochs
- **Transfer Learning:** Reuses representations learned on large datasets (ImageNet) — especially valuable when your own dataset is small
- **Adam vs SGD:** Adam adapts per-parameter learning rates using gradient moments, converging faster and more robustly than vanilla SGD in most deep learning tasks

---

## Technologies

- **Framework:** TensorFlow 2.x, Keras Functional API
- **Architectures:** MLP (Dense), CNN (Conv2D, MaxPool2D), VGG19
- **Optimizers:** SGD, Adam
- **Regularization:** Dropout, BatchNormalization, Early Stopping
- **Environment:** Google Colab with GPU acceleration
