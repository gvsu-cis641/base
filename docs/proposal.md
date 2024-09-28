**Team name**:  Pengun

**Team members**: Hamin Hong

# Introduction

The main goal of this project is to create a generative AI system that can generate new guitar chords and original music. Using Variational Autoencoders (VAEs), we’ll train the model to pick up on musical patterns, focusing on chord progressions and overall structure. The aim here is to provide a tool that helps users come up with new musical ideas, where the system acts more as a creative partner, not a replacement.

# Anticipated Technologies

- **VAEs** will be the core of the generative process.
- **Python** with **TensorFlow** or **PyTorch** will be used for development and training.
- I’ll use **Music21** or a similar library to handle musical data efficiently.
- A well-labeled **dataset** of guitar chords and compositions will be critical for training.
- **Git/GitLab** will be the go-to for version control and collaboration throughout.

# Method/Approach

1. **Data Collection and Preprocessing**: First, I’ll gather a diverse dataset of guitar music, making sure everything is labeled and preprocessed correctly. This step will be essential for training the model accurately.
   
2. **Model Development**: Next, I’ll train the VAE using this dataset. The main task here is to teach the model to recognize patterns in chord sequences and generate new compositions based on that.

3. **Output Generation**: I’ll start generating outputs and adjust the model’s parameters as needed to make sure the generated music sounds musically coherent.

4. **User Interface Development**: I’ll develop an interface that allows users to input preferences and generate music. This will also let users tweak the generated outputs.

5. **Testing and Refinement**: Throughout the process, I’ll gather feedback and refine the model as necessary to ensure the tool is both creative and user-friendly.

# Estimated Timeline

- **Week 1-2**: Data gathering and preprocessing.
- **Week 3-5**: Train the VAE model with the collected dataset.
- **Week 6-7**: Start testing and tweaking the generated outputs.
- **Week 8-9**: Develop and integrate the user interface with the model.
- **Week 10~**: Final testing, refinements, and integrating user feedback.

# Anticipated Problems

- **Data Quality**: It might be tough to get a dataset that’s diverse enough to cover different musical styles.
- **Model Training**: Fine-tuning the VAE to generate coherent and high-quality music might take a lot of time and computational resources.
- **User Interface**: Making the interface user-friendly and intuitive could be a challenge, especially when it comes to presenting the generated music in a meaningful way.
- **Music Creativity**: Finding the balance between randomness and musical quality will be key. We want the generated outputs to be creative but still make musical sense.
