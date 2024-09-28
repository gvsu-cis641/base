**Team name**:  

**Team members**: Hamin Hong

# Introduction

The goal of this project is to develop a generative AI system capable of producing new guitar chords and original music compositions. Using Variational Autoencoders (VAEs), we aim to teach the model to recognize patterns in music, particularly guitar chord progressions and musical structures. The objective is to create a tool that allows users to generate fresh musical ideas, with the system functioning as a partner in the creative process.

# Anticipated Technologies

- **Variational Autoencoders (VAEs)** will form the backbone of the generative model.
- **Python**, along with **TensorFlow** or **PyTorch**, will be used for model development and training.
- **Music21** or a similar music-processing library will assist in handling musical data.
- A **dataset** of labeled guitar chords and compositions will provide the necessary training data.
- We'll use **Git/GitLab** for version control and collaboration.

# Method/Approach

1. **Data Collection and Preprocessing**: We will gather a diverse dataset of guitar music with labeled chord progressions. It’s crucial to ensure the dataset is well-prepared and consistent before feeding it into the model.
   
2. **Model Development**: We'll train the VAE using this dataset. The goal is for the model to recognize patterns and generate guitar chord sequences and compositions based on those learned patterns.

3. **Output Generation**: We'll test the generated outputs, adjusting the VAE parameters where necessary, to produce guitar progressions that are musically sound.

4. **User Interface Development**: I'll develop an interface where users can input their preferences and generate new music. The interface will allow users to fine-tune outputs based on their feedback.

5. **Testing and Refinement**: Continuous feedback from testing will be crucial. We'll refine the model to ensure the outputs meet both creative and usability standards.

# Estimated Timeline

- **Week 1-2**: Focus on gathering and preprocessing data.
- **Week 3-5**: Develop and train the VAE model using the dataset.
- **Week 6-7**: Begin testing and fine-tuning the generative model.
- **Week 8-9**: Develop and integrate the user interface with the model.
- **Week 10**: Final testing, refinement, and incorporating user feedback.

# Anticipated Problems

- **Data Quality**: Ensuring the dataset is diverse enough to capture a wide variety of styles will be a challenge.
- **Model Training**: The VAE model may require extensive fine-tuning to produce high-quality, coherent music.
- **User Interface Complexity**: Developing an interface that makes the AI-generated outputs intuitive and user-friendly might take significant effort.
- **Musical Creativity**: Balancing randomness with musically acceptable outputs will be critical, ensuring that the generated music feels creative but not chaotic.
