# Hierarchical Bayesian Modeling of CD8+ T-cell Exhaustion Dynamics Using scRNA-seq Data and MCMC Predicts Immune Checkpoint Blockade Response in Melanoma Patients
Immune checkpoint blockade (ICB) therapies have revolutionized melanoma treatment by targeting progenitor exhausted CD8+ T cells, reinvigorating their functionality and preventing progression to terminal exhaustion, thereby enhancing their tumor-fighting capacity. Traditional approaches often classify exhausted CD8+ T cells into two distinct categories—progenitor exhausted and terminally exhausted—overlooking the continuous and dynamic nature of T-cell exhaustion as a biological process. To address this, we developed a Hierarchical Bayesian Model leveraging single-cell RNA sequencing (scRNA-seq) data and Markov Chain Monte Carlo (MCMC) to quantify CD8+ T-cell exhaustion as a continuous probability (0–1). The model's hierarchical structure, combined with its carefully selected parameters and thoughtfully designed probability distributions, effectively captures patient-level variability, gene-specific effects, zero-inflation in gene expression, and other complexities inherent to single-cell data. This design enables robust estimation of exhaustion probabilities across cells, capturing the continuous gradient from progenitor to terminal exhaustion states. We further examine the relationship between aggregated exhaustion probabilities and patient response to ICB therapy. Applying this approach to melanoma data, we demonstrate that CD8+ T-cell exhaustion gradients can predict treatment outcomes, offering valuable insights into the immune landscape and advancing precision immunotherapy. This methodology underscores the importance of moving beyond binary classifications to capture the nuanced continuum of immune cell states and dynamic biological processes.

### Setup Instructions

#### 1. **Clone the Repository**
Download the repository to your local machine:
```bash
git clone https://github.com/MYousry2002/CD8ExhaustionHierBayes.git
cd CD8ExhaustionHierBayes
```

#### 2. Set Up the Environment
The repository includes a script setup_venv.sh to automate the creation of a virtual environment, installation of dependencies, and Jupyter Notebook kernel setup.
Make sure you have Python 3.9 or higher installed and run:
```bash
bash setup_venv.sh
```

#### 3. Run the Jupyter Notebooks
Once the environment is set up:
1. Launch Jupyter Notebook:

```bash
jupyter notebook
```
2. Select the Python (CD8ExhaustionHierBayes_env) kernel from the notebook interface.
3. Open and run the following notebooks:
* 1-scRNAseqAnalysis.ipynb: Standard scRNA-seq analysis and clustering.
* 2-scGeneExprProbDistr.ipynb: Modeling gene expression probability distributions.
* 3-HeirBayesModelMCMC.ipynb: Hierarchical Bayesian model implementation.
* 4-TreatmentResponsePrediction.ipynb: Linking exhaustion gradients to treatment response.

#### 4. Deactivate the Environment
When you're done, deactivate the virtual environment:
```bash
deactivate
```
