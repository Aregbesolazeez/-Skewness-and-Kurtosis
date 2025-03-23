install.packages("e1071")  # Only run once
library(e1071)

# Generate synthetic spending data (Right-skewed data)
spending <- c(rnorm(80, mean=50, sd=10), rnorm(20, mean=100, sd=15))

# Compute skewness & kurtosis
spending_skewness <- skewness(spending)
spending_kurtosis <- kurtosis(spending)

# Display results
cat("Skewness:", spending_skewness, "\n")
cat("Kurtosis:", spending_kurtosis, "\n")

library(ggplot2)

# Create dataframe
df <- data.frame(Spending = spending)

# Histogram with density curve
ggplot(df, aes(x=Spending)) +
  geom_histogram(aes(y=..density..), bins=20, fill="blue", alpha=0.6, color="black") +
  geom_density(color="red", size=1.2) +
  ggtitle("Customer Spending Distribution") +
  xlab("Spending per Transaction ($)") +
  ylab("Density") +
  theme_minimal()
