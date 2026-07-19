# PA9
# Jelena Radovanovic
# 07/18/2026
# Creating a model of fuel efficiency with mtcars dataset

#Plotting data
plot(mtcars$wt, mtcars$mpg, 
     main = "Fuel Efficiency",
     xlab = "Vehicle Weight (Thousands OF Pounds)",
     ylab = "Miles Per Gallon (MPG)")

#Fit a Linear Regression Model
Rmodel <- lm(mpg ~ wt, data = mtcars)

#Fitted Regresion Line
abline(model, col = "red")

#Interpreting the slope
slope_summary <- summary(Rmodel)
slope_estimate <- slope_summary$coefficients ["wt","Estimate"]
cat("Slope Estimate: ", slope_estimate)

p_value <- slope_summary$coefficients["wt", "Pr(>|t|)"]
cat("p_value: " , p_value)

conf_intervals <- confint(Rmodel,"wt", level = 0.95)
cat("95% Confidence Interval for Slope: ", conf_intervals)
cat("The slope is statistically significant at the 0.05 level, indicating a significant relationship between weight and fuel efficiency.\n")

#Predicting MPG for given weight
new_data <- data.frame(wt = 6)
prediction <- predict(model, newdata = new_data, interval = "prediction", level = 0.95)
cat("Predicted MPG for a 6,000-pound vehicle:\n")
print(prediction)
cat("Note: The weight value is outside the range of the dataset, which limits the accuracy of the prediction. Use caution when interpreting this result.\n")

