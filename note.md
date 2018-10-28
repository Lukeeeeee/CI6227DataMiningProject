
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

Speed (normal distributed on label, no impact on label) (10s - 20s for 100m]
Height (small impact on label, treat as categorical) (140cm - 200cm)
Weight (normal distributed on label, no impact on label, treat as categorical) [70kg - 100kg]
Average Scores number Per Game (Higher for offense)  [0, 6]
Average Assistance number (Higher for offense) [0, 6]
Average Stealing number (Higher for defense) [0, 20]
Average Tacking number (Higher for defense) [0, 20]
Average Fouls number (Higher for defense, redundent attributes of Yellow/Red Card number) [0, 20]

Discrete Attributes:

Game playing time
Saving time (For goal keeper only, which is a quite special attribute) (0, 1, 2, ... 10)
Age (no impact on label) (16..40)
Nation (no impact on label) (A, B, C, D)
Yellow/Red Card number in recent 10 games (Higher for defense, redundent attributes of Average Fouls number) (0, 1, ...20) 
```

to classify football player into different roles:
```
1. Goalkeeper
2. Defenders 
3. Midfielders
4. Attackers
```

### Label Generating Method
For attributes, considering its contribution or weight to different label. 

For continuous data, first scale it into `[0, 1]`, 


### Experiments Design
```
1. dataset generation tuning
    1.1 Tunign the weight parameters, the distrution changes on label, 
    e.g. how the weight effect the decision on label
    
2. Classfication tuning
    2.1 Hyper parameters searching on train step, learning rate, loss function(?)
    
3. Feature importance
    3.1 tuning the weight parameters of dataset generation and 
        under the same clasffication setting, how the feature importance change 
```