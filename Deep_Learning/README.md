# Deep Learning

![Python](https://img.shields.io/badge/Python-3.x-blue?logo=python&logoColor=white)
![TensorFlow](https://img.shields.io/badge/TensorFlow-2.19-orange?logo=tensorflow&logoColor=white)
![Keras](https://img.shields.io/badge/Keras-Functional_API-red?logo=keras&logoColor=white)
![Google Colab](https://img.shields.io/badge/Google_Colab-Notebook-yellow?logo=googlecolab&logoColor=white)

## Course Overview

Hands-on exploration of deep learning architectures using TensorFlow/Keras. The course covers multi-layer perceptrons (MLPs), convolutional neural networks (CNNs), transfer learning, and deep regression, with systematic comparison of optimizers, regularization techniques, and training strategies.

## Projects

### 1. MNIST Handwritten Digit Classification

#### MLP Approach (Mnist-MLP.ipynb)

**Task:** Classify 28x28 grayscale images of handwritten digits (0-9) using fully connected networks.

**Architecture:**
- Input: 784 features (flattened 28x28 images)
- Hidden layers: 256 units with ReLU activation (configurable depth)
- Output: 10 classes with softmax activation
- Loss: Categorical cross-entropy

**Experiments:**
| Model | Optimizer | Test Accuracy |
|---|---|---|
| Logistic Regression (no hidden) | SGD (lr=0.01) | ~92% |
| MLP (1 hidden layer, 256 units) | SGD (lr=0.01) | ~97% |
| Logistic Regression (no hidden) | Adam | ~92% |
| MLP (1 hidden layer, 256 units) | Adam | ~98% |

**Key Findings:** Adding a single hidden layer significantly boosts accuracy. Adam optimizer converges faster and achieves better results than vanilla SGD.

#### CNN Approach (Mnist-CNN.ipynb)

**Task:** Same digit classification but using convolutional layers that preserve spatial structure.

**Architecture:**
- Input: 28x28x1 images (no flattening needed)
- 3 Conv2D layers (8, 16, 32 filters) with 3x3 kernels + MaxPooling
- Optional Dropout (rate=0.2) after each pooling layer
- Flatten + Dense output layer (10 classes)

**Experiments:**
| Model | Dropout | Early Stopping | Test Accuracy |
|---|---|---|---|
| 3-layer CNN | No | No | ~99.0% |
| 3-layer CNN | 0.2 | No | ~99.1% |
| 3-layer CNN | 0.2 | Patience=10 | ~99.1% |
| 3-layer CNN | 0.2 | Patience=20 | ~99.1% |

**Key Findings:** CNNs dramatically outperform MLPs on image data. Dropout regularization helps reduce overfitting (narrower train-validation gap). Early stopping prevents unnecessary training epochs.

---

### 2. CIFAR-100 Image Classification (Transfer Learning)

#### VGG19 Fine-Tuning (CIFAR-CNN.ipynb)

**Task:** Classify 32x32 color images into 100 categories using transfer learning with VGG19.

**Architecture:**
- Base: VGG19 pre-trained on ImageNet (frozen initially)
- Custom head: 3 Dense layers (1024 → 1024 → 512) with ReLU + Dropout (0.2)
- Output: 100 classes with softmax
- Two-phase training strategy

**Training Strategy:**
1. **Phase 1 (30 epochs):** Train only the custom head (VGG19 layers frozen), Adam optimizer
2. **Phase 2 (70 epochs):** Fine-tune entire network with low learning rate (1e-5), Early Stopping (patience=10)

**Key Findings:** Transfer learning enables strong performance on CIFAR-100 despite having only 32x32 images. The two-phase approach prevents catastrophic forgetting of pre-trained features.

---

### 3. Deep Regression (XOR Problem)

#### Binary Vector XOR (Deep-Regression.ipynb)

**Task:** Learn the element-wise XOR function between pairs of 5-bit binary vectors using regression (MSE loss).

**Why XOR?** XOR is a non-linearly separable problem - a linear model cannot learn it, making it the perfect test case for demonstrating why we need hidden layers.

**Architecture:**
- Input: 10 features (two 5-bit vectors concatenated)
- Hidden: 10 units with ReLU activation
- Output: 5 units (predicted XOR result)
- Loss: Mean Squared Error (MSE)

**Experiments:**

*Small dataset (256 training samples):*
| Model | Optimizer | Test MSE |
|---|---|---|
| Linear Regression | SGD | 0.268 |
| Deep Regressor | SGD | 0.250 |
| Linear Regression | SGD + Momentum | 0.268 |
| Deep Regressor | SGD + Momentum | 0.047 |
| Linear Regression | SGD + Nesterov | 0.268 |
| Deep Regressor | SGD + Nesterov | 0.105 |

*Full dataset (1024 samples):*
| Model | Optimizer | Test MSE |
|---|---|---|
| Linear Regression | SGD + Nesterov | 0.250 |
| Deep Regressor | SGD + Nesterov (lr=0.01) | 0.032 |
| Deep Regressor | SGD + Nesterov (lr=0.5) | 0.172 |
| Deep Regressor | Adam | ~0.000 |

**Key Findings:**
- Linear models plateau at MSE ~0.25 (cannot learn XOR)
- Deep regressors with non-linear activations solve XOR
- Momentum-based optimizers significantly help convergence
- Adam achieves near-perfect MSE (~0) on the full dataset
- Learning rate matters: too high (0.5) causes instability

---

## Repository Structure

```
Deep_Learning/
├── README.md
├── Deep-Regression.ipynb           # XOR regression with optimizer comparisons
├── MNIST-Classification/
│   ├── Mnist-MLP.ipynb             # MLP approach (SGD vs Adam)
│   └── Mnist-CNN.ipynb             # CNN with dropout & early stopping
└── CIFAR-100-Classification/
    └── CIFAR-CNN.ipynb             # VGG19 transfer learning
```

## Technologies & Concepts

- **Framework:** TensorFlow 2.19, Keras Functional API
- **Architectures:** MLP, CNN (Conv2D, MaxPool2D), VGG19 (Transfer Learning)
- **Optimizers:** SGD, SGD + Momentum, SGD + Nesterov, RMSprop, Adam
- **Regularization:** Dropout, Early Stopping (patience tuning)
- **Training:** Two-phase fine-tuning, learning rate comparison, batch training
- **Datasets:** MNIST (60K/10K), CIFAR-100 (50K/10K), Synthetic XOR
- **Environment:** Google Colab with GPU acceleration
