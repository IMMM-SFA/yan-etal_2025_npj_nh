<!--[![DOI](https://zenodo.org/badge/265254045.svg)](https://zenodo.org/doi/10.5281/zenodo.10442485)-->

# yan-etal\_2025\_npj\_nh

**Escalating Drought Propagation Across the Contiguous United States under Rising Temperatures**

Hongxiang Yan<sup>1*</sup>, Ning Sun<sup>1</sup>, Lili Yao<sup>1</sup>, Travis Thurber<sup>1</sup>, and Jennie Rice<sup>1</sup>

<sup>1 </sup> Pacific Northwest National Laboratory, Richland, WA, USA
<br/>

\* Correspondence: Hongxiang Yan, [hongxiang.yan@pnnl.gov](mailto:hongxiang.yan@pnnl.gov)

## Abstract
Droughts can propagate from meteorological droughts (MD) into agricultural (AD) and hydrological droughts (HD). However, the mechanisms by which rising temperatures and changes in precipitation amount influence MD propagation—and how these dynamics vary across U.S.—are not yet fully understood. This gap is critical given the U.S.’s diverse climates and land-use patterns, which lead to region-specific drought vulnerabilities and impacts, such as the 2012 AD in the Midwest and the 2014 HD in the western U.S. Using a dynamical-statistical framework and a land surface model, we assess warming impacts on drought propagation. Results reveal that the Midwest and Southeast—key agricultural regions—show the largest increases in MD propagation to AD/HD, driven by rising temperatures and declining precipitation, though magnitudes vary regionally. In contrast, the Northeast shows reduced propagation due to increased year-round precipitation. Higher-intensity AD/HD events become disproportionately more likely, with rates varying by region and MD intensity.

## Journal reference
Yan, H., Sun, N., Yao, L., Thurber, T., and Rice, J. (2025). Escalating Drought Propagation Across the Contiguous United States under Rising Temperatures. Submitted to NPJ Natural Hazards – March 2025.

## Data Reference

### Input Data
|       Dataset       |               URL                |               DOI                |
|:-------------------:|:--------------------------------------------:|:--------------------------------:|
|   CAMELS dataset    | https://gdex.ucar.edu/dataset/camels.html | https://dx.doi.org/10.5065/D6MW2F4D, https://doi.org/10.5065/D6G73C3Q |
| TGW-WRF | https://tgw-data.msdlive.org/ | https://doi.org/10.1038/s41597-023-02485-5, https://doi.org/10.57931/1885756 |
| Behavioral Ensemble CLM5 Parameter Sets | https://data.msdlive.org/records/41bw1-3q739 | https://doi.org/10.57931/2274938 |

### Output Data
| Dataset | URL | DOI |
|:-------:|:---:|:---:|
| CLM5 CAMELS basin ensemble simulations | https://data.msdlive.org/records/5rpkv-h8n12 | https://doi.org/10.57931/1922953 |

### Contributing Modeling Software
| Model | Version | URL | DOI |
|:-----:|:-------:|:---:|:---:|
| CLM5  |  im3v1.0.0 | https://github.com/IMMM-SFA/im3-clm | https://zenodo.org/records/6653705 |
| IM3 Components | 0cf45e8 | https://github.com/IMMM-SFA/im3components/tree/main/im3components/wrf\_to\_clm | |

## Reproduce my experiment

Clone the [CLM5 repository](https://github.com/IMMM-SFA/im3-clm) to set up the CLM5 model. You will need to download the [TGW forcing data](https://data.msdlive.org/records/ksw6r-2xv06) and convert them into CLM input format using these [scripts](https://github.com/IMMM-SFA/im3components/tree/main/im3components/wrf\_to\_clm). You will also need to generate ensemble hydrological parameter value files using the [behavioral parameter values](https://data.msdlive.org/records/41bw1-3q739). The [output data repository](https://data.msdlive.org/records/5rpkv-h8n12) already contains the ensemble output from the CLM5 model so you can skip rerunning the CLM5 model if you want to save time.

## Reproduce my figures
Use the scripts found in the `figures` directory to reproduce the figures used in this publication.

| Figure Numbers | Script Name | Description | Figure |
|:--------------:|:-----------:|:-----------:|:------:|
| 2  | [Figure_2.m](./figures/Figure_2.m) | Changes in precipitation, air temperature, and drought characteristics | <a href="./figures/figures/Figure_2.png"><img width="100" src="./figures/figures/Figure_2.png"/></a> |
| 3  | [Figure_3.m](./figures/Figure_3.m) | Projected changes in drought propagation probabilities | <a href="./figures/figures/Figure_3.png"><img width="100" src="./figures/figures/Figure_3.png"/></a> |
| 4  | [Figure_4.m](./figures/Figure_4.m) | Propagation probabilities following the occurrence of a D1 meteorological drought | <a href="./figures/figures/Figure_4.png"><img width="100" src="./figures/figures/Figure_4.png"/></a> |
| S2  | [Figure_S2.m](./figures/Figure_S2.m) | Monthly air temperature changes | <a href="./figures/figures/Figure_S2.png"><img width="100" src="./figures/figures/Figure_S2.png"/></a> |
| S3  | [Figure_S3.m](./figures/Figure_S3.m) | Annual air temperature changes | <a href="./figures/figures/Figure_S3.png"><img width="100" src="./figures/figures/Figure_S3.png"/></a> |
| S4  | [Figure_S4.m](./figures/Figure_S4.m) | Monthly precipitation changes | <a href="./figures/figures/Figure_S4.png"><img width="100" src="./figures/figures/Figure_S4.png"/></a> |
| S5  | [Figure_S5.m](./figures/Figure_S5.m) | Annual precipitation changes | <a href="./figures/figures/Figure_S5.png"><img width="100" src="./figures/figures/Figure_S5.png"/></a> |
| S6  | [Figure_S6.m](./figures/Figure_S6.m) | MD frequency changes | <a href="./figures/figures/Figure_S6.png"><img width="100" src="./figures/figures/Figure_S6.png"/></a> |
| S7  | [Figure_S7.m](./figures/Figure_S7.m) | AD frequency changes | <a href="./figures/figures/Figure_S7.png"><img width="100" src="./figures/figures/Figure_S7.png"/></a> |
| S8  | [Figure_S8.m](./figures/Figure_S8.m) | HD frequency changes | <a href="./figures/figures/Figure_S8.png"><img width="100" src="./figures/figures/Figure_S8.png"/></a> |
| S9  | [Figure_S9.m](./figures/Figure_S9.m) | SPI vs. SPEI on MD | <a href="./figures/figures/Figure_S9.png"><img width="100" src="./figures/figures/Figure_S9.png"/></a> |
| S10  | [Figure_S10.m](./figures/Figure_S10.m) | NW drought characteristic changes | <a href="./figures/figures/Figure_S10.png"><img width="100" src="./figures/figures/Figure_S10.png"/></a> |
| S11  | [Figure_S11.m](./figures/Figure_S11.m) | SW drought characteristic changes | <a href="./figures/figures/Figure_S11.png"><img width="100" src="./figures/figures/Figure_S11.png"/></a> |
| S12  | [Figure_S12.m](./figures/Figure_S12.m) | MW drought characteristic changes | <a href="./figures/figures/Figure_S12.png"><img width="100" src="./figures/figures/Figure_S12.png"/></a> |
| S13  | [Figure_S13.m](./figures/Figure_S13.m) | GP drought characteristic changes | <a href="./figures/figures/Figure_S13.png"><img width="100" src="./figures/figures/Figure_S13.png"/></a> |
| S14  | [Figure_S14.m](./figures/Figure_S14.m) | NE drought characteristic changes | <a href="./figures/figures/Figure_S14.png"><img width="100" src="./figures/figures/Figure_S14.png"/></a> |
| S15  | [Figure_S15.m](./figures/Figure_S15.m) | SE drought characteristic changes | <a href="./figures/figures/Figure_S15.png"><img width="100" src="./figures/figures/Figure_S15.png"/></a> |
| S16  | [Figure_S16.m](./figures/Figure_S16.m) | lag time in drought propagation  | <a href="./figures/figures/Figure_S16.png"><img width="100" src="./figures/figures/Figure_S16.png"/></a> |
| S17  | [Figure_S17.m](./figures/Figure_S17.m) | AD drought probability given D0 MD | <a href="./figures/figures/Figure_S17.png"><img width="100" src="./figures/figures/Figure_S17.png"/></a> |
| S18  | [Figure_S18.m](./figures/Figure_S18.m) | AD drought probability given D1 MD | <a href="./figures/figures/Figure_S18.png"><img width="100" src="./figures/figures/Figure_S18.png"/></a> |
| S19  | [Figure_S19.m](./figures/Figure_S19.m) | AD drought probability given D2 MD | <a href="./figures/figures/Figure_S19.png"><img width="100" src="./figures/figures/Figure_S19.png"/></a> |
| S20  | [Figure_S20.m](./figures/Figure_S20.m) | AD drought probability given D3 MD | <a href="./figures/figures/Figure_S20.png"><img width="100" src="./figures/figures/Figure_S20.png"/></a> |
| S21  | [Figure_S21.m](./figures/Figure_S21.m) | AD drought probability given D4 MD | <a href="./figures/figures/Figure_S21.png"><img width="100" src="./figures/figures/Figure_S21.png"/></a> |
| S22  | [Figure_S22.m](./figures/Figure_S22.m) | HD drought probability given D0 MD | <a href="./figures/figures/Figure_S22.png"><img width="100" src="./figures/figures/Figure_S22.png"/></a> |
| S23  | [Figure_S23.m](./figures/Figure_S23.m) | HD drought probability given D1 MD | <a href="./figures/figures/Figure_S23.png"><img width="100" src="./figures/figures/Figure_S23.png"/></a> |
| S24  | [Figure_S24.m](./figures/Figure_S24.m) | HD drought probability given D2 MD | <a href="./figures/figures/Figure_S24.png"><img width="100" src="./figures/figures/Figure_S24.png"/></a> |
| S25  | [Figure_S25.m](./figures/Figure_S25.m) | HD drought probability given D3 MD | <a href="./figures/figures/Figure_S25.png"><img width="100" src="./figures/figures/Figure_S25.png"/></a> |
| S26  | [Figure_S26.m](./figures/Figure_S26.m) | HD drought probability given D4 MD | <a href="./figures/figures/Figure_S26.png"><img width="100" src="./figures/figures/Figure_S26.png"/></a> |

