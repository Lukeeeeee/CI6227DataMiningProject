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

Speed (normal distributed on label, no impact on label)
Height (small impact on label, treat as categorical)
Weight (normal distributed on label, no impact on label, treat as categorical)
Average Scores number (Higher for offense)
Average Assistance number (Higher for offense)
Average Stealing number (Higher for defense)
Average Tacking number (Higher for defense)
Average Fouls number (Higher for defense, redundent attributes of Yellow/Red Card number)

Discrete Attributes:

Game playing time
Saving time (For goal keeper only, which is a quite special attribute)
Age (no impact on label)
Nation (no impact on label)
Yellow/Red Card number (Higher for defense, redundent attributes of Average Fouls number)
```

to classify football player into different roles:

```
1. Goalkeeper
2. Defenders 
3. Midfielders
4. Attackers
```