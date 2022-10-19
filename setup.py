import setuptools

with open("README.md", "r") as fh:
    long_description = fh.read()

setuptools.setup(
    name="presto-md",
    packages=["presto", "presto.solvents"],
    package_data={"presto.solvents": ["*"],},
    version="0.2.8",
    author="Corin Wagen",
    author_email="corin.wagen@gmail.com",
    license="Apache 2.0",
    description="explicit solvent molecular dynamics",
    long_description=long_description,
    long_description_content_type="text/markdown",
    url="https://github.com/cwagen/presto",
#    packages=setuptools.find_packages(),
    install_requires=["cctk==0.2.14", "tqdm", "h5py", "pyyaml", "matplotlib", "asciichartpy", "fasteners"],
    classifiers=[
        "Programming Language :: Python :: 3",
        "Development Status :: 3 - Alpha",
        "License :: OSI Approved :: Apache Software License",
        "Intended Audience :: Science/Research",
    ],
    python_requires='>=3.6',
)
