# CI6227DataMiningProject
CI-6227 Data Mining Project NTU Fall 2018

## Due 28 Oct.
### Millstone

1. Build up a basic code framework

2. Implement the method for generating the dataset

3. Implement the gradient boosting by using CatBoost Library

4. Tune the model and improve the performance

5. Result analysis and visualization


### Attributes List
Use football player statistical features like:
```
Continuous Attributes:

Speed (Normal distributed, no impact on label)
Height (small impact on label)
Weight (small impact on label)
Average Scores number (Higher for offense)
Average Assistance number (Higher for offense)
Average Stealing number (Higher for defense)
Average Tacking number (Higher for defense)

Discrete Attributes:

Game playing time
Saving time (For goal keeper only, which is a quite special attributes)
Age (no impact on label)
Nation (no impact on label)

```

to classify football player into different roles:

```
1. Goalkeeper
2. Defenders 
3. Midfielders
4. Attackers
```