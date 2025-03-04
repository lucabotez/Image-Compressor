Copyright @lucabotez

# Image Compressor

## Overview
This project explores **image compression techniques** using **Singular Value Decomposition (SVD)** and **Principal Component Analysis (PCA)**. By reducing the dimensionality of image data, we achieve efficient storage and reconstruction while maintaining image quality.

## Features
- **SVD-based compression** to approximate images using a reduced number of singular values.
- **PCA-based compression** to transform images into principal components, capturing essential features while reducing data size.
- **Reconstruction** of compressed images with minimal loss of quality.
- **Comparison of different compression levels** to analyze trade-offs between quality and storage efficiency.

## Implementation Details
### **1. SVD-Based Image Compression**
- Uses **Singular Value Decomposition (SVD)** to factorize the image matrix.
- Keeps only the top `k` singular values, reducing storage while preserving structure.
- Eliminates low-value singular components that contribute minimally to image details.

### **2. PCA-Based Image Compression**
- Computes the **covariance matrix** of the image data.
- Extracts the top `k` **principal components**, reducing redundant information.
- Projects the image data into a lower-dimensional space and reconstructs it using fewer features.

## Notes
- Higher values of `k` retain more image details but require more storage.
- PCA is particularly useful for reducing redundancy while maintaining important image structures.
- The project provides an efficient balance between compression ratio and image quality.

